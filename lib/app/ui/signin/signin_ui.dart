import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:flutter/services.dart';
import 'package:zipting/app/controller/signin/signin_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class SignInUi extends GetView<SignInController> {
  const SignInUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.currentFocus.value = FocusScope.of(context);

          if (!controller.currentFocus.value.hasPrimaryFocus &&
              controller.currentFocus.value.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Obx(
          () => Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Form(
                key: controller.globalFormKey.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Image.asset(
                        "assets/images/signin.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Container(
                            height: Get.height - 260,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                              ),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(40),
                            height: Get.height - 260,
                            child: ListView(
                              children: [
                                Column(
                                  children: const [
                                    LogoWidget(),
                                    EmailWidget(),
                                    PasswordWidget(),
                                    FindWidget(),
                                    ElevatedButtonWidget(),
                                    TempWidget(),
                                    SignUpTextButtonWidget(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    customLoaderWidget(
                        isLoaderisible: controller.isLoaderVisible.value),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class LogoWidget extends GetView<SignInController> {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Container(
                width: 186,
                alignment: Alignment.topLeft,
                child: Image.asset("assets/icons/logo_pink.png"),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
}

class EmailWidget extends GetView<SignInController> {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.emailController.value,
            focusNode: controller.emailFocusNode.value,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(
                  r"/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{3,}$/i")),
            ],
            onFieldSubmitted: (value) =>
                controller.handleEmailOnFieldSubmitted(),
            validator: (value) =>
                controller.handleValidator(type: "email", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              hintText: "이메일을 입력해주세요",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      );
}

class PasswordWidget extends GetView<SignInController> {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            TextFormField(
              controller: controller.passwordController.value,
              focusNode: controller.passwordFocusNode.value,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              obscureText: controller.isPasswordVisible.value,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(20),
              ],
              onFieldSubmitted: (value) =>
                  controller.handlePasswordOnFieldSubmitted(),
              validator: (value) =>
                  controller.handleValidator(type: "password", value: value),
              style: const TextStyle(color: kTextBodyColor, fontSize: 20),
              decoration: InputDecoration(
                hintText: "비밀번호를 입력해주세요",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor, width: 2),
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value,
                  // color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  icon: Icon(controller.isPasswordVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
            ),
          ],
        ),
      );
}

class FindWidget extends GetView<SignInController> {
  const FindWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text(
                  "이메일 / 비밀번호 찾기",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Get.toNamed("/find", preventDuplicates: false),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      );
}

class ElevatedButtonWidget extends GetView<SignInController> {
  const ElevatedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            width: Get.width,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                "로그인",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: const BorderSide(color: kPrimaryColor, width: 2),
                ),
                shadowColor: Colors.black,
              ),
              onPressed: () => controller.handleSignInProvider(),
            ),
          ),
          const SizedBox(height: 15),
        ],
      );
}

class SignUpTextButtonWidget extends GetView<SignInController> {
  const SignUpTextButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 32,
        child: TextButton(
          child: const Text(
            "집팅이 처음이신가요?",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () =>
              Get.toNamed("/signup/terms", preventDuplicates: false),
        ),
      );
}

class TempWidget extends GetView<SignInController> {
  const TempWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          TextButton(
            child: const Text(
              "phongdaegi",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => controller.handleTempProvider(type: "phongdaegi"),
          ),
          const SizedBox(width: 10),
          TextButton(
            child: const Text(
              "ghongdaegi",
              style: TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => controller.handleTempProvider(type: "ghongdaegi"),
          ),
        ],
      );
}

// Widget _socialWidget() => Column(
//       children: [
//         const Text(
//           "다른 방법으로 로그인 하기",
//           style: TextStyle(
//             color: Colors.black45,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 30),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               width: 46,
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: Image.asset("assets/icons/kakao.png"),
//                 onPressed: () {},
//               ),
//             ),
//             Container(
//               width: 46,
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: Image.asset("assets/icons/facebook.png"),
//                 onPressed: () {},
//               ),
//             ),
//             Container(
//               width: 46,
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: Image.asset("assets/icons/google.png"),
//                 onPressed: () {},
//               ),
//             ),
//           ],
//         )
//       ],
//     );
