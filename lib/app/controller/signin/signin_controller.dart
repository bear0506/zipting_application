import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zipting/app/data/model/signin/signin_model.dart';
import 'package:zipting/app/data/provider/signin/signin_provider.dart';
import 'package:zipting/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:zipting/main.dart';

class SignInController extends GetxController {
  final Rx<GlobalKey<FormState>> globalFormKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<FocusScopeNode> currentFocus = FocusScopeNode().obs;
  final Rx<FocusNode> emailFocusNode = FocusNode().obs;
  final Rx<FocusNode> passwordFocusNode = FocusNode().obs;

  // 로더
  RxBool isLoaderVisible = false.obs;
  // 비밀번호 폼 필드 보기/숨기기
  RxBool isPasswordVisible = true.obs;
  // 비밀번호 정규식
  RegExp pwRegExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$");

  void handleEmailOnFieldSubmitted() =>
      EmailValidator.validate(emailController.value.text)
          ? passwordFocusNode.value.requestFocus()
          : emailFocusNode.value.requestFocus();

  void handlePasswordOnFieldSubmitted() =>
      pwRegExp.hasMatch(passwordController.value.text)
          ? handleSignInProvider()
          : passwordFocusNode.value.requestFocus();

  // 폼 텍스트 벨리데이션 체크
  String? handleValidator({required String type, required dynamic value}) {
    switch (type) {
      case "email":
        if (value!.isEmpty) {
          return "이메일을 입력해주세요.";
        }

        // 이메일 패턴 체크
        if (!EmailValidator.validate(value)) {
          return "올바른 이메일을 입력해주세요.";
        }
        break;
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
      default:
        return null;
    }

    return null;
  }

  // 로그인
  Future<void> handleSignInProvider() async {
    try {
      if (globalFormKey.value.currentState!.validate()) {
        Rx<SignInRequestModel> requestModel = SignInRequestModel(
          email: "",
          password: "",
        ).obs;

        requestModel.update((_) {
          _?.email = emailController.value.text;
          _?.password = passwordController.value.text;
        });

        isLoaderVisible.value = true;

        await SignInProvider().dio(requestModel: requestModel).then((value) {
          if (value.status == "success") {
            GetStorage().write("token", value.accessToken);
            Get.offAllNamed("/main");
          } else {
            logger.d(value.message);
            globalSnackBarWidget(message: value.message);
            Future.delayed(const Duration(milliseconds: 100),
                () => passwordFocusNode.value.requestFocus());
          }
        });
      }
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = false;
    }
  }

  // 임시 로그인
  Future<void> handleTempProvider({required String type}) async {
    try {
      Rx<SignInRequestModel> requestModel = SignInRequestModel(
        email: "",
        password: "",
      ).obs;

      switch (type) {
        case "phongdaegi":
          requestModel.update((_) {
            _?.email = "phongdaegi@naver.com";
            _?.password = "Tkdqhrdl826!@#";
          });
          break;
        case "ghongdaegi":
          requestModel.update((_) {
            _?.email = "ghongdaegi@naver.com";
            _?.password = "Tkdqhrdl826!@#";
          });
          break;
      }

      isLoaderVisible.value = true;

      await SignInProvider().dio(requestModel: requestModel).then((value) {
        if (value.status == "success") {
          GetStorage().write("token", value.accessToken);
          Get.offAllNamed("/main");
        } else {
          logger.d(value.message);
          globalSnackBarWidget(message: value.message);
          Future.delayed(const Duration(milliseconds: 100),
              () => passwordFocusNode.value.requestFocus());
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      isLoaderVisible.value = false;
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
