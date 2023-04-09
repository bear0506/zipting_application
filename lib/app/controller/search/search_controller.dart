import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/data/model/more/more_profile_model.dart';
import 'package:zipting/app/data/provider/more/more_profile_provider.dart';
import 'package:zipting/main.dart';

class SearchController extends GetxController {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  final nicknameTextFormFieldController = TextEditingController();
  final introduceTextFormFieldController = TextEditingController();

  late FocusScopeNode currentFocus;
  late FocusNode nicknameTextFormFieldFocusNode;
  late FocusNode introduceTextFormFieldFocusNode;
  late FocusNode outlinedButtonFocusNode;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 로더
  RxBool isLoaderVisible = false.obs;
  // 리퀘스트 오류 메세지
  RxString reqeustMessage = "".obs;
  // 이미지
  RxList imageList = [].obs;
  // 수정 버튼 활성 여부
  RxBool isoutlinedButtonEnabled = true.obs;
  // 수정 성공 여부
  RxBool isUpdateProvider = false.obs;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String bigImage = 'assets/icons/search.png';
  String smallImage = 'assets/icons/search_small.png';
  Widget cusSearchBar = Text("여기에 검색어를 입력해주세요.",
      style: TextStyle(color: Colors.black, fontSize: 20));
  Icon cusIcon = Icon(Icons.search);
  Widget searchBar = Container(
    width: 90,
    height: 30,
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        TextField(
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
              hintText: '어떤 집을 찾고 계신가요?', border: InputBorder.none),
          style: TextStyle(
            color: kBlackColor,
            fontSize: 15,
          ),
        ),
        Image.asset('assets/icons/search_small.png', width: 24, height: 24)
      ],
    ),
  );

  TextStyle outlinedButtonTextStyle() => isoutlinedButtonEnabled.value == true
      ? const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
      : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

  ButtonStyle outlinedButtonStyle() => isoutlinedButtonEnabled.value == true
      ? OutlinedButton.styleFrom(
          side: const BorderSide(color: kPrimaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: Colors.white,
          elevation: 1.1,
          shadowColor: Colors.black,
        )
      : OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade200, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: Colors.grey.shade100,
          elevation: 1.1,
          shadowColor: Colors.black,
        );

  // 이미지 선택시
  Future<void> handleSelectImage() async {
    final XFile? selectedImages =
        await picker.pickImage(source: ImageSource.gallery);

    imageList.add({
      "type": "local",
      "path": selectedImages!.path,
      "base64": handleBase64Format(selectedImages.path)
    });

    logger.d(imageList);
  }

  // Base64 변환
  String handleBase64Format(String path) {
    File file = File(path);
    List<int> fileInByte = file.readAsBytesSync();
    return base64Encode(fileInByte);
  }

  // NetWork Base64 변환
  Future<String> handleNetworkBase64Format(String path) async {
    http.Response response = await http.get(Uri.parse(path));
    return base64Encode(response.bodyBytes);
  }

  // 이미지 배열 삭제
  void handleImageDelete({required int index}) {
    imageList.removeAt(index);
  }

  // 폼 텍스트 다음 포커스 체크
  void handleNextFocusNode({String? type, String? value}) {
    switch (type) {
      case "nickname":
        if (value!.length >= 6) {
          return introduceTextFormFieldFocusNode.requestFocus();
        } else {
          return nicknameTextFormFieldFocusNode.requestFocus();
        }
      case "introduce":
        if (value!.length >= 6) {
          return introduceTextFormFieldFocusNode.requestFocus();
        } else {
          handleUpdateProvider();
        }
        break;
      default:
        return;
    }
  }

  // 폼 텍스트 벨리데이션 체크
  dynamic handleValidator({String? type, String? value}) {
    switch (type) {
      case "nickname":
        if (value!.isEmpty) {
          return "닉네임을 입력해주세요.";
        }

        // 3자리 이상
        if (value.length < 3) {
          return "닉네임을 3자리 이상 입력해주세요.";
        }

        // 8자리 이하 확인
        if (value.length > 8) {
          return "닉네임을 8자리 이하로 입력해주세요.";
        }
        break;
      case "introduce":
        if (value!.isEmpty) {
          return "자기소개를 입력해주세요.";
        }

        // 6자리 이상
        if (value.length < 6) {
          return "자기소개를 6자리 이상 입력해주세요.";
        }
        break;
      default:
        return null;
    }

    return null;
  }

  // 리퀘스트 모델(데이터 넘기기)
  Rx<MoreProfileUpdateRequestModel> updateRequestModel =
      MoreProfileUpdateRequestModel(
    images: [],
    nickname: "",
    introduce: "",
  ).obs;

  void handleUpdateRequestModel({
    required dynamic images,
    required String nickname,
    required String introduce,
  }) {
    updateRequestModel.update((_) {
      _?.images = imageList;
      _?.nickname = nickname;
      _?.introduce = introduce;
    });
  }

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await MoreProfileReadProvider().dio().then((value) async {
        if (value.status == "success") {
          nicknameTextFormFieldController.text = value.user.nickname;
          introduceTextFormFieldController.text = value.user.introduce;

          final imageBase64 = await handleNetworkBase64Format(value.user.photo);

          imageList.add({
            "type": "network",
            "path": value.user.photo,
            "base64": imageBase64,
          });

          logger.d(imageList);
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(const Duration(milliseconds: 500),
          () => isShimmerVisible.value = false);
    }
  }

  // 수정
  Future<void> handleUpdateProvider() async {
    try {
      handleUpdateRequestModel(
        images: imageList,
        nickname: nicknameTextFormFieldController.text,
        introduce: introduceTextFormFieldController.text,
      );

      logger.d(updateRequestModel.toJson());

      await MoreProfileUpdateProvider()
          .dio(requestModel: updateRequestModel)
          .then((value) {
        if (value.status == "success") {
          isUpdateProvider(true);
          Get.find<MyPageController>().handleInitProvider();
        } else {
          logger.d(value.message);
          reqeustMessage.value = value.message;
          isUpdateProvider(false);
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    nicknameTextFormFieldFocusNode = FocusNode();
    introduceTextFormFieldFocusNode = FocusNode();
    outlinedButtonFocusNode = FocusNode();

    handleInitProvider();

    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    nicknameTextFormFieldController.dispose();
    introduceTextFormFieldController.dispose();

    nicknameTextFormFieldFocusNode.dispose();
    introduceTextFormFieldFocusNode.dispose();
    outlinedButtonFocusNode.dispose();

    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
