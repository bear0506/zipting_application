import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zipting/app/controller/management/management_house_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/data/model/management/management_house_model.dart';
import 'package:zipting/app/data/provider/management/management_house_provider.dart';
import 'package:zipting/main.dart';

class ManageMentHouseUpdateController extends GetxController {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  final titleTextFormFieldController = TextEditingController();
  final contentTextFormFieldController = TextEditingController();
  final addressTextFormFieldController = TextEditingController();
  final pointTextFormFieldController = TextEditingController();
  final houseTypeTextFormFieldController = TextEditingController();
  final contractTypeTextFormFieldController = TextEditingController();
  final acreageTextFormFieldController = TextEditingController();
  final startedAtTextFormFieldController = TextEditingController();
  final endedAtTextFormFieldController = TextEditingController();

  late FocusScopeNode currentFocus;
  late FocusNode titleTextFormFieldFocusNode;
  late FocusNode contentTextFormFieldFocusNode;
  late FocusNode addressTextFormFieldFocusNode;
  late FocusNode pointTextFormFieldFocusNode;
  late FocusNode houseTypeTextFormFieldFocusNode;
  late FocusNode contractTypeTextFormFieldFocusNode;
  late FocusNode roomCountTextFormFieldFocusNode;
  late FocusNode bedCountTextFormFieldFocusNode;
  late FocusNode bathRoomCountTextFormFieldFocusNode;
  late FocusNode acreageTextFormFieldFocusNode;
  late FocusNode startedAtTextFormFieldFocusNode;
  late FocusNode endedAtTextFormFieldFocusNode;
  late FocusNode outlinedButtonFocusNode;

  Rx<dynamic> houseIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 로더
  RxBool isLoaderVisible = false.obs;
  // 리퀘스트 오류 메세지
  RxString reqeustMessage = "".obs;
  // 이미지
  RxList imageList = [].obs;
  // 매물타입
  RxList<String> houseTypeList = ["아파트", "빌라", "주택"].obs;
  Rx houseType = "아파트".obs;
  // 계약타입
  RxList<String> contractTypeList = ["자가", "전세", "월세"].obs;
  Rx contractType = "자가".obs;
  // 방개수
  Rx roomCount = "1".obs;
  // 침대개수
  Rx bedCount = "1".obs;
  // 욕실개수
  Rx bathRoomCount = "1".obs;
  // 시작
  Rx<DateTime> startedAt = DateTime.now().obs;
  // 종료
  Rx<DateTime> endedAt = DateTime.now().obs;
  // 수정 버튼 활성 여부
  RxBool isoutlinedButtonEnabled = true.obs;
  // 리퀘스트 성공 여부
  RxBool isUpdateProvider = false.obs;

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
      "idx": null,
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
      case "title":
        if (value!.length >= 6) {
          return contentTextFormFieldFocusNode.requestFocus();
        } else {
          return titleTextFormFieldFocusNode.requestFocus();
        }
      case "content":
        if (value!.length >= 6) {
          return contentTextFormFieldFocusNode.requestFocus();
        } else {
          return addressTextFormFieldFocusNode.requestFocus();
        }
      case "address":
        if (value!.length >= 6) {
          return pointTextFormFieldFocusNode.requestFocus();
        } else {
          return addressTextFormFieldFocusNode.requestFocus();
        }
      case "point":
        if (value!.isNotEmpty) {
          return pointTextFormFieldFocusNode.requestFocus();
        } else {
          return pointTextFormFieldFocusNode.requestFocus();
        }
      default:
        return;
    }
  }

  // 폼 텍스트 벨리데이션 체크
  dynamic handleValidator({String? type, String? value}) {
    switch (type) {
      case "title":
        if (value!.isEmpty) {
          return "제목을 입력해주세요.";
        }

        // 6자리 이상
        if (value.length < 6) {
          return "제목을 6자리 이상 입력해주세요.";
        }
        break;
      case "content":
        if (value!.isEmpty) {
          return "내용을 입력해주세요.";
        }

        // 6자리 이상
        if (value.length < 6) {
          return "내용을 6자리 이상 입력해주세요.";
        }
        break;
      case "address":
        if (value!.isEmpty) {
          return "주소를 입력해주세요.";
        }

        // 6자리 이상
        if (value.length < 6) {
          return "주소를 6자리 이상 입력해주세요.";
        }
        break;
      case "acreage":
        if (value!.isEmpty) {
          return "평수를 입력해주세요.";
        }
        break;
      default:
        return null;
    }

    return null;
  }

  // 날짜 선택
  Future<dynamic> handleDatePikcer(
      {required dynamic context, required String type}) {
    Future<DateTime?> future = showDatePicker(
      context: context,
      initialDate: type == "시작"
          ? DateTime.now()
          : DateTime(
              startedAt.value.year, startedAt.value.month, startedAt.value.day),
      firstDate: type == "시작"
          ? DateTime.now()
          : DateTime(
              startedAt.value.year, startedAt.value.month, startedAt.value.day),
      lastDate: DateTime(2099),
      builder: (BuildContext context, Widget? child) => child!,
    );

    return future.then((date) {
      if (type == "시작") {
        startedAtTextFormFieldController.text =
            DateFormat("yyyy.MM.dd").format(DateTime.parse(date.toString()));
        startedAt.value = DateTime.parse(date.toString());
      } else if (type == "종료") {
        endedAtTextFormFieldController.text =
            DateFormat("yyyy.MM.dd").format(DateTime.parse(date.toString()));
        endedAt.value = DateTime.parse(date.toString());
      }
    });
  }

  // 리퀘스트 모델(데이터 넘기기)
  Rx<ManagementHouseUpdateRequestModel> updateRequestModel =
      ManagementHouseUpdateRequestModel(
    images: [],
    title: "",
    content: "",
    address: "",
    point: 0,
    houseType: "",
    contractType: "",
    roomCount: 0,
    bedCount: 0,
    bathRoomCount: 0,
    acreage: 0,
    startedAt: DateTime.now(),
    endedAt: DateTime.now(),
  ).obs;

  void handleUpdateRequestModel({
    required dynamic images,
    required String title,
    required String content,
    required String address,
    required int point,
    required String houseType,
    required String contractType,
    required int roomCount,
    required int bedCount,
    required int bathRoomCount,
    required int acreage,
    required DateTime startedAt,
    required DateTime endedAt,
  }) {
    updateRequestModel.update((_) {
      _?.images = imageList;
      _?.title = title;
      _?.content = content;
      _?.address = address;
      _?.point = point;
      _?.houseType = houseType;
      _?.contractType = contractType;
      _?.roomCount = roomCount;
      _?.bedCount = bedCount;
      _?.bathRoomCount = bathRoomCount;
      _?.acreage = acreage;
      _?.startedAt = startedAt;
      _?.endedAt = endedAt;
    });
  }

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await ManagementHouseTargetReadProvider()
          .dio(houseIdx: houseIdx.value)
          .then((value) async {
        if (value.status == "success") {
          titleTextFormFieldController.text = value.houses.title;
          contentTextFormFieldController.text = value.houses.content;
          addressTextFormFieldController.text = value.houses.address;
          pointTextFormFieldController.text = value.houses.point.toString();
          houseType.value = value.houses.houseType;
          contractType.value = value.houses.contractType;
          roomCount.value = value.houses.roomCount.toString();
          bedCount.value = value.houses.bedCount.toString();
          bathRoomCount.value = value.houses.bathRoomCount.toString();
          acreageTextFormFieldController.text = value.houses.acreage.toString();
          startedAtTextFormFieldController.text = value.houses.startedAt2;
          endedAtTextFormFieldController.text = value.houses.endedAt2;
          startedAt.value = DateTime.parse(value.houses.startedAt3);
          endedAt.value = DateTime.parse(value.houses.endedAt3);

          for (var i = 0; i < value.houses.photos.length; i++) {
            final imageBase64 =
                await handleNetworkBase64Format(value.houses.photos[i].url);

            imageList.add({
              "idx": value.houses.photos[i].idx,
              "type": "network",
              "path": value.houses.photos[i].url,
              "base64": imageBase64,
            });
          }

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
        title: titleTextFormFieldController.text,
        content: contentTextFormFieldController.text,
        address: addressTextFormFieldController.text,
        point: int.parse(pointTextFormFieldController.text),
        houseType: houseType.value,
        contractType: contractType.value,
        roomCount: int.parse(roomCount.value),
        bedCount: int.parse(bedCount.value),
        bathRoomCount: int.parse(bathRoomCount.value),
        acreage: int.parse(acreageTextFormFieldController.text),
        startedAt: startedAt.value,
        endedAt: endedAt.value,
      );

      logger.d(updateRequestModel.toJson());

      await ManagementHouseUpdateProvider()
          .dio(houseIdx: houseIdx.value, requestModel: updateRequestModel)
          .then((value) {
        if (value.status == "success") {
          Get.find<ManageMentHouseController>().handleInitProvider();
          isUpdateProvider(true);
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
    titleTextFormFieldFocusNode = FocusNode();
    contentTextFormFieldFocusNode = FocusNode();
    addressTextFormFieldFocusNode = FocusNode();
    pointTextFormFieldFocusNode = FocusNode();
    houseTypeTextFormFieldFocusNode = FocusNode();
    contractTypeTextFormFieldFocusNode = FocusNode();
    roomCountTextFormFieldFocusNode = FocusNode();
    bedCountTextFormFieldFocusNode = FocusNode();
    bathRoomCountTextFormFieldFocusNode = FocusNode();
    acreageTextFormFieldFocusNode = FocusNode();
    startedAtTextFormFieldFocusNode = FocusNode();
    endedAtTextFormFieldFocusNode = FocusNode();
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
    titleTextFormFieldController.dispose();
    contentTextFormFieldController.dispose();
    addressTextFormFieldController.dispose();
    pointTextFormFieldController.dispose();
    houseTypeTextFormFieldController.dispose();
    contractTypeTextFormFieldController.dispose();
    acreageTextFormFieldController.dispose();
    startedAtTextFormFieldController.dispose();
    endedAtTextFormFieldController.dispose();

    titleTextFormFieldFocusNode.dispose();
    contentTextFormFieldFocusNode.dispose();
    addressTextFormFieldFocusNode.dispose();
    pointTextFormFieldFocusNode.dispose();
    houseTypeTextFormFieldFocusNode.dispose();
    contractTypeTextFormFieldFocusNode.dispose();
    roomCountTextFormFieldFocusNode.dispose();
    bedCountTextFormFieldFocusNode.dispose();
    bathRoomCountTextFormFieldFocusNode.dispose();
    acreageTextFormFieldFocusNode.dispose();
    startedAtTextFormFieldFocusNode.dispose();
    endedAtTextFormFieldFocusNode.dispose();
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
