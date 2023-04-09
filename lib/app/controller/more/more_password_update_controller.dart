import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/data/model/more/more_password_model.dart';
import 'package:zipting/app/data/provider/more/more_password_provider.dart';
import 'package:zipting/main.dart';

class MorePasswordUpdateController extends GetxController {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final passwordTextFormFieldController = TextEditingController();
  final passwordReTextFormFieldController = TextEditingController();

  late FocusScopeNode currentFocus;
  late FocusNode passwordTextFormFieldFocusNode;
  late FocusNode passwordReTextFormFieldFocusNode;
  late FocusNode outlinedButtonFocusNode;

  Rx<dynamic> houseIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 로더
  RxBool isLoaderVisible = false.obs;
  // 비밀번호 입력
  RegExp pwRegExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");
  // 비밀번호 보이기/숨기기
  RxBool isPasswordHideVisible = true.obs;
  // 비밀번호 확인 보이기/숨기기
  RxBool isPasswordReHideVisible = true.obs;
  // 수정 버튼 활성 여부
  RxBool isoutlinedButtonEnabled = true.obs;
  // 수정 성공 여부
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

  // 폼 텍스트 다음 포커스 체크
  void handleNextFocusNode({String? type, String? value}) {
    switch (type) {
      case "password":
        if (pwRegExp.hasMatch(value!)) {
          return passwordReTextFormFieldFocusNode.requestFocus();
        } else {
          return passwordTextFormFieldFocusNode.requestFocus();
        }
      case "passwordRe":
        if (pwRegExp.hasMatch(value!)) {
          handleUpdateProvider();
        } else {
          return passwordReTextFormFieldFocusNode.requestFocus();
        }
        break;
      default:
        return;
    }
  }

  // 폼 텍스트 벨리데이션 체크
  dynamic handleValidator({String? type, String? value}) {
    switch (type) {
      case "password":
        if (value!.isEmpty) {
          return "비밀번호를 입력해주세요.";
        }

        if (value.length < 6) {
          return "비밀번호를 6자리 이상 입력해주세요.";
        }

        if (!pwRegExp.hasMatch(value)) {
          return "대소문자 숫자 특수문자를 입력해주세요.";
        }
        break;
      case "passwordRe":
        if (value!.isEmpty) {
          return "비밀번호를 다시 입력해주세요.";
        }

        if (value.length < 6) {
          return "비밀번호를 6자리 이상 입력해주세요.";
        }

        if (!pwRegExp.hasMatch(value)) {
          return "대소문자 숫자 특수문자를 입력해주세요.";
        }

        if (passwordTextFormFieldController.text != value) {
          return "비밀번호가 올바르지 않습니다.";
        }
        break;
      default:
        return null;
    }

    return null;
  }

  // 리퀘스트 모델(데이터 넘기기)
  Rx<MorePasswordUpdateRequestModel> updateRequestModel =
      MorePasswordUpdateRequestModel(
    password: "",
  ).obs;

  void handleUpdateRequestModel({
    required String password,
  }) {
    updateRequestModel.update((_) {
      _?.password = password;
    });
  }

  // 수정
  Future<void> handleUpdateProvider() async {
    try {
      if (globalFormKey.currentState!.validate()) {
        handleUpdateRequestModel(
          password: passwordTextFormFieldController.text,
        );

        logger.d(updateRequestModel.toJson());

        await MorePasswordUpdateProvider()
            .dio(requestModel: updateRequestModel)
            .then((value) {
          if (value.status == "success") {
            isUpdateProvider(true);
          } else {
            logger.d(value.message);
            isUpdateProvider(false);
          }
        });
      }
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    passwordTextFormFieldFocusNode = FocusNode();
    passwordReTextFormFieldFocusNode = FocusNode();
    outlinedButtonFocusNode = FocusNode();

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
    passwordTextFormFieldController.dispose();
    passwordReTextFormFieldController.dispose();

    passwordTextFormFieldFocusNode.dispose();
    passwordReTextFormFieldFocusNode.dispose();
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
