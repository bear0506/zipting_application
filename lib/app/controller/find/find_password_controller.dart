import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/find/find_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/data/model/find/find_model.dart';
import 'package:zipting/app/data/provider/find/find_provider.dart';
import 'package:zipting/app/data/provider/send/send_provider.dart';
import 'package:zipting/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:zipting/main.dart';

class FindPasswordController extends GetxController {
  final Rx<GlobalKey<FormState>> globalFormKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> phoneController = TextEditingController().obs;
  final Rx<TextEditingController> phoneVerifyController =
      TextEditingController().obs;
  final Rx<FocusNode> emailFocusNode = FocusNode().obs;
  final Rx<FocusNode> phoneFocusNode = FocusNode().obs;
  final Rx<FocusNode> phoneVerifyFocusNode = FocusNode().obs;
  final Rx<FocusNode> phoneVerifyButtonFocusNode = FocusNode().obs;
  final Rx<FocusNode> findButtonFocusNode = FocusNode().obs;

  // 이메일 폼 필드 활성 여부
  RxBool isEmailEnabled = true.obs;
  // 휴대폰 번호 폼 필드 활성 여부
  RxBool isPhoneEnabled = false.obs;
  // 인증 번호 폼 필드 활성 여부
  RxBool isPhoneVerifyEnabled = true.obs;
  // 인증 번호 전송 버튼 활성 여부
  RxBool isPhoneVerifyButtonEnabled = false.obs;
  // 인증 번호 및 버튼보이기/숨기기
  RxBool isPhoneVerifyVisible = false.obs;
  // 비밀번호 찾기 버튼 활성 여부
  RxBool isFindButtonEnabled = false.obs;

  Rx<FindPasswordRequestModel> requestModel = FindPasswordRequestModel(
    email: "",
    phone: "",
  ).obs;

  Rx<FindPasswordVerifyRequestModel> verifyRequestModel =
      FindPasswordVerifyRequestModel(
    phone: "",
    number: "",
  ).obs;

  // 인증번호 전송 버튼 텍스트 스타일
  TextStyle phoneVerifyButtonTextStyle() =>
      EmailValidator.validate(emailController.value.text) &&
              isPhoneVerifyButtonEnabled.value == true
          ? const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
          : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

  // 인증번호 전송 버튼 스타일
  ButtonStyle phoneVerifyButtonStyle() =>
      EmailValidator.validate(emailController.value.text) &&
              isPhoneVerifyButtonEnabled.value == true
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

  // 비밀번호 찾기 버튼 텍스트 스타일
  TextStyle findButtonTextStyle() => isFindButtonEnabled.value == true
      ? const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)
      : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);

  // 비밀번호 찾기 버튼 스타일
  ButtonStyle findButtonStyle() => isFindButtonEnabled.value == true
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

  void handleEmailOnFieldSubmitted() =>
      EmailValidator.validate(emailController.value.text)
          ? phoneFocusNode.value.requestFocus()
          : emailFocusNode.value.requestFocus();

  void handleEmailOnChanged() =>
      EmailValidator.validate(emailController.value.text)
          ? isPhoneEnabled.value = true
          : isPhoneEnabled.value = false;

  void handlePhoneOnChanged() => phoneController.value.text.length >= 11
      ? isPhoneVerifyButtonEnabled.value = true
      : isPhoneVerifyButtonEnabled.value = false;

  void handlePhoneVerifyOnFieldSubmitted() =>
      phoneVerifyController.value.text.length >= 6
          ? handleVerifyProvider()
          : null;

  void handlePhoneVerifyOnChanged() =>
      phoneVerifyController.value.text.length >= 6
          ? isFindButtonEnabled.value = true
          : isFindButtonEnabled.value = false;

  // 벨리데이션
  String? handleValidator({required String type, required dynamic value}) {
    switch (type) {
      case "email":
        if (value!.isEmpty) {
          return "이메일을 입력해주세요.";
        }

        if (!EmailValidator.validate(value)) {
          return "올바른 이메일을 입력해주세요.";
        }
        break;
      case "phone":
        if (value!.isEmpty) {
          return "핸드폰 번호를 입력해주세요.";
        }

        if (value.length < 11) {
          return "올바른 핸드폰 번호를 입력해주세요.";
        }
        break;
      case "phoneVerify":
        if (value!.isEmpty) {
          return "인증번호를 입력해주세요.";
        }

        if (value.length != 6) {
          return "인증번호 6자리를 입력해주세요.";
        }
        break;
    }

    return null;
  }

  // 인증번호 발송
  void handleChangeState({
    bool isEmailEnabled = true,
    bool isPhoneEnabled = true,
    bool isPhoneVerifyButtonEnabled = false,
    bool isPhoneVerifyVisible = false,
    bool isLoadervisible = false,
  }) {
    this.isEmailEnabled.value = isEmailEnabled;
    this.isPhoneEnabled.value = isPhoneEnabled;
    this.isPhoneVerifyButtonEnabled.value = isPhoneVerifyButtonEnabled;
    this.isPhoneVerifyVisible.value = isPhoneVerifyVisible;
    Get.find<FindController>().isLoadervisible.value = isLoadervisible;
  }

  // 인증하기
  void handleVerifyChangeState({
    bool isPhoneVerifyEnabled = true,
    bool isFindButtonEnabled = false,
    bool isLoadervisible = false,
  }) {
    this.isPhoneVerifyEnabled.value = isPhoneVerifyEnabled;
    this.isFindButtonEnabled.value = isFindButtonEnabled;
    Get.find<FindController>().isLoadervisible.value = isLoadervisible;
  }

  // 초기화
  void handleResetChangeState() {
    emailController.value.text = "";
    phoneController.value.text = "";
    phoneVerifyController.value.text = "";
    globalFormKey.value.currentState!.reset();
    isEmailEnabled.value = true;
    isPhoneEnabled.value = false;
    isPhoneVerifyEnabled.value = true;
    isPhoneVerifyButtonEnabled.value = false;
    isPhoneVerifyVisible.value = false;
    isFindButtonEnabled.value = false;
    Get.find<FindController>().isLoadervisible.value = false;
  }

  void handleRequestModelUpdate() => requestModel.update((_) {
        _?.email = emailController.value.text;
        _?.phone = phoneController.value.text;
      });

  void handleVerifyRequestModelUpdate() => verifyRequestModel.update((_) {
        _?.email = emailController.value.text;
        _?.phone = phoneController.value.text;
        _?.number = phoneVerifyController.value.text;
      });

  Future<void> handleProvider() async {
    try {
      if (isPhoneVerifyButtonEnabled.value == true &&
          EmailValidator.validate(emailController.value.text) &&
          phoneController.value.text.length >= 11) {
        handleRequestModelUpdate();
        handleChangeState(
            isEmailEnabled: false,
            isPhoneEnabled: false,
            isPhoneVerifyButtonEnabled: false,
            isPhoneVerifyVisible: true,
            isLoadervisible: true);

        await SendFindProvider().dio(requestModel: requestModel).then((value) {
          handleChangeState(
              isEmailEnabled: value.status != "success" ? true : false,
              isPhoneEnabled: value.status != "success" ? true : false,
              isPhoneVerifyButtonEnabled:
                  value.status != "success" ? true : false,
              isPhoneVerifyVisible: value.status != "success" ? false : true,
              isLoadervisible: false);

          if (value.status == "success") {
            Future.delayed(const Duration(milliseconds: 100),
                () => phoneVerifyFocusNode.value.requestFocus());
          } else {
            globalSnackBarWidget(message: value.message);
          }
        });
      }
    } catch (e) {
      logger.d(e);
      handleChangeState(
          isEmailEnabled: true,
          isPhoneEnabled: true,
          isPhoneVerifyButtonEnabled: true,
          isPhoneVerifyVisible: false,
          isLoadervisible: false);
      globalSnackBarWidget(message: "인증번호를 다시 요청해주세요.");
    } finally {
      Future.delayed(const Duration(milliseconds: 100),
          () => phoneFocusNode.value.requestFocus());
    }
  }

  Future<void> handleVerifyProvider() async {
    try {
      if (isFindButtonEnabled.value == true &&
          EmailValidator.validate(emailController.value.text) &&
          phoneVerifyController.value.text.length >= 6) {
        handleVerifyRequestModelUpdate();
        handleVerifyChangeState(
            isFindButtonEnabled: true,
            isPhoneVerifyEnabled: false,
            isLoadervisible: true);

        await FindPassWordProvider()
            .dio(requestModel: verifyRequestModel)
            .then((value) {
          handleVerifyChangeState(
              isFindButtonEnabled: value.status != "success" ? true : false,
              isPhoneVerifyEnabled: value.status != "success" ? true : false,
              isLoadervisible: false);

          if (value.status == "success") {
            Get.offAllNamed(
                "/success?title=인증 완료&content=등록하신 핸드폰 번호로 임시 비밀번호가 전송되었습니다.&action=signin");
          } else {
            if (value.message == "가입된 계정을 찾을 수 없습니다.") {
              handleResetChangeState();
            }
            globalSnackBarWidget(message: value.message);
          }
        });
      }
    } catch (e) {
      logger.d(e);
      handleVerifyChangeState(
          isFindButtonEnabled: true,
          isPhoneVerifyEnabled: false,
          isLoadervisible: false);
      globalSnackBarWidget(message: "인증번호를 다시 요청해주세요.");
    } finally {
      Future.delayed(const Duration(milliseconds: 100),
          () => phoneVerifyFocusNode.value.requestFocus());
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
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
    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
