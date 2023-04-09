import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/data/model/more/more_privacy_model.dart';
import 'package:zipting/app/data/provider/more/more_privacy_provider.dart';
import 'package:zipting/main.dart';

class MorePrivacyUpdateController extends GetxController {
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final emailTextFormFieldController = TextEditingController();
  final nameTextFormFieldController = TextEditingController();
  final phoneTextFormFieldController = TextEditingController();

  late FocusScopeNode currentFocus;
  late FocusNode emailTextFormFieldFocusNode;
  late FocusNode nameTextFormFieldFocusNode;
  late FocusNode phoneTextFormFieldFocusNode;
  late FocusNode outlinedButtonFocusNode;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 로더
  RxBool isLoaderVisible = false.obs;
  // 리퀘스트 오류 메세지
  RxString reqeustMessage = "".obs;
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
      case "email":
        if (value!.length >= 6) {
          return nameTextFormFieldFocusNode.requestFocus();
        } else {
          return emailTextFormFieldFocusNode.requestFocus();
        }
      case "name":
        if (value!.length >= 6) {
          return phoneTextFormFieldFocusNode.requestFocus();
        } else {
          return nameTextFormFieldFocusNode.requestFocus();
        }
      case "phone":
        if (value!.length >= 6) {
          handleUpdateProvider();
        } else {
          return phoneTextFormFieldFocusNode.requestFocus();
        }
        break;
      default:
        return;
    }
  }

  // 폼 텍스트 벨리데이션 체크
  dynamic handleValidator({String? type, String? value}) {
    switch (type) {
      case "email":
        if (value!.isEmpty) {
          return "이메일을 입력해주세요.";
        }

        // 3자리 이상
        if (value.length < 3) {
          return "이메일을 3자리 이상 입력해주세요.";
        }

        // 8자리 이하 확인
        if (value.length > 8) {
          return "이메일을 8자리 이하로 입력해주세요.";
        }
        break;
      case "name":
        if (value!.isEmpty) {
          return "이름을 입력해주세요.";
        }

        // 6자리 이상
        if (value.length < 6) {
          return "이름을 6자리 이상 입력해주세요.";
        }
        break;
      case "phone":
        if (value!.isEmpty) {
          return "핸드폰 번호를 입력해주세요.";
        }

        // 6자리 이상
        if (value.length < 6) {
          return "핸드폰 번호를 6자리 이상 입력해주세요.";
        }
        break;
      default:
        return null;
    }

    return null;
  }

  // 리퀘스트 모델(데이터 넘기기)
  Rx<MorePrivacyUpdateRequestModel> updateRequestModel =
      MorePrivacyUpdateRequestModel(
    email: "",
    name: "",
    phone: "",
  ).obs;

  void handleUpdateRequestModel({
    required String email,
    required String name,
    required String phone,
  }) {
    updateRequestModel.update((_) {
      _?.email = email;
      _?.name = name;
      _?.phone = phone;
    });
  }

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await MorePrivacyReadProvider().dio().then((value) async {
        if (value.status == "success") {
          emailTextFormFieldController.text = value.user.email;
          nameTextFormFieldController.text = value.user.name;
          phoneTextFormFieldController.text = value.user.phone;
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
        email: emailTextFormFieldController.text,
        name: nameTextFormFieldController.text,
        phone: phoneTextFormFieldController.text,
      );

      logger.d(updateRequestModel.toJson());

      await MorePrivacyUpdateProvider()
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
    emailTextFormFieldFocusNode = FocusNode();
    nameTextFormFieldFocusNode = FocusNode();
    phoneTextFormFieldFocusNode = FocusNode();
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
    emailTextFormFieldController.dispose();
    nameTextFormFieldController.dispose();
    phoneTextFormFieldController.dispose();

    emailTextFormFieldFocusNode.dispose();
    nameTextFormFieldFocusNode.dispose();
    phoneTextFormFieldFocusNode.dispose();
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
