import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/find/find_controller.dart';
import 'package:zipting/app/controller/find/find_email_controller.dart';
import 'package:zipting/app/controller/find/find_password_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class FindUi extends GetView<FindController> {
  const FindUi({Key? key}) : super(key: key);

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
          () => DefaultTabController(
            length: 2,
            child: Stack(
              children: [
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: _appbarWidget(),
                  body: const SafeArea(
                    child: TabBarView(
                      children: [
                        EmailFindWidget(),
                        PasswordFindWidget(),
                      ],
                    ),
                  ),
                ),
                customLoaderWidget(
                    isLoaderisible: controller.isLoadervisible.value),
              ],
            ),
          ),
        ),
      );

  PreferredSizeWidget _appbarWidget() => AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
            size: 32,
          ),
          tooltip: "뒤로가기",
          onPressed: () => Get.back(),
        ),
        bottom: TabBar(
          tabs: const [
            Tab(
              text: "이메일 찾기",
            ),
            Tab(text: "비밀번호 찾기"),
          ],
          onTap: (value) => controller.tabBarOnTabAction(value: value),
          indicatorColor: kPrimaryColor,
          unselectedLabelColor: Colors.black26,
          labelColor: Colors.black54,
          labelStyle: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class AppbarWidget extends GetView<FindController>
    implements PreferredSizeWidget {
  const AppbarWidget({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
            size: 32,
          ),
          tooltip: "뒤로가기",
          onPressed: () => Get.back(),
        ),
        bottom: TabBar(
          tabs: const [
            Tab(
              text: "이메일 찾기",
            ),
            Tab(text: "비밀번호 찾기"),
          ],
          onTap: (value) => controller.tabBarOnTabAction(value: value),
          indicatorColor: kPrimaryColor,
          unselectedLabelColor: Colors.black26,
          labelColor: Colors.black54,
          labelStyle: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class EmailFindWidget extends GetView<FindEmailController> {
  const EmailFindWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Form(
        key: controller.globalFormKey.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    EmailFindNameWidget(),
                    EmailFindPhoneWidget(),
                    EmailFindPhoneVerifyWidget(),
                  ],
                ),
              ),
            ),
            const EmailFindOutlinedButtonWidget(),
          ],
        ),
      );
}

class EmailFindNameWidget extends GetView<FindEmailController> {
  const EmailFindNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            TextFormField(
              controller: controller.nameController.value,
              focusNode: controller.nameFocusNode.value,
              enabled: controller.isNameEnabled.value,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              autofocus: true,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(8),
              ],
              onFieldSubmitted: (value) =>
                  controller.handleNameOnFieldSubmitted(),
              onChanged: (value) => controller.handleNameOnChanged(),
              validator: (value) =>
                  controller.handleValidator(type: "name", value: value),
              style: const TextStyle(color: kTextBodyColor, fontSize: 20),
              decoration: const InputDecoration(
                hintText: "이름을 입력해주세요.",
                hintStyle: TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}

class EmailFindPhoneWidget extends GetView<FindEmailController> {
  const EmailFindPhoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.phoneController.value,
                    focusNode: controller.phoneFocusNode.value,
                    enabled: controller.isPhoneEnabled.value,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    onFieldSubmitted: (value) =>
                        controller.handleEmailProvider(),
                    onChanged: (value) => controller.handlePhoneOnChanged(),
                    validator: (value) =>
                        controller.handleValidator(type: "phone", value: value),
                    style: const TextStyle(color: kTextBodyColor, fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: "휴대전화번호 입력 ('-' 제외)",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 0,
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: OutlinedButton(
                      focusNode: controller.phoneVerifyButtonFocusNode.value,
                      child: Text(
                        "인증번호 전송",
                        style: controller.phoneVerifyButtonTextStyle(),
                      ),
                      onPressed: () => controller.handleEmailProvider(),
                      style: controller.phoneVerifyButtonStyle(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}

class EmailFindPhoneVerifyWidget extends GetView<FindEmailController> {
  const EmailFindPhoneVerifyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyVisible.value,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: false,
          maintainSemantics: false,
          maintainInteractivity: false,
          child: Column(
            children: [
              TextFormField(
                controller: controller.phoneVerifyController.value,
                focusNode: controller.phoneVerifyFocusNode.value,
                enabled: controller.isPhoneVerifyEnabled.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onFieldSubmitted: (value) =>
                    controller.handlePhoneVerifyOnFieldSubmitted(),
                onChanged: (value) => controller.handlePhoneVerifyOnChanged(),
                validator: (value) => controller.handleValidator(
                    type: "passwordVerify", value: value),
                style: const TextStyle(color: kTextBodyColor, fontSize: 20),
                decoration: const InputDecoration(
                  hintText: "인증번호 6자리",
                  hintStyle: TextStyle(
                    color: Colors.black12,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class EmailFindOutlinedButtonWidget extends GetView<FindEmailController> {
  const EmailFindOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyVisible.value,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: false,
          maintainSemantics: false,
          maintainInteractivity: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
              width: double.infinity,
              height: 70,
              child: OutlinedButton(
                focusNode: controller.findButtonFocusNode.value,
                child: Text(
                  "인증하기",
                  style: controller.findButtonTextStyle(),
                ),
                onPressed: () => controller.handleVerifyProvider(),
                style: controller.findButtonStyle(),
              ),
            ),
          ),
        ),
      );
}

class PasswordFindWidget extends GetView<FindPasswordController> {
  const PasswordFindWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Form(
        key: controller.globalFormKey.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(40),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    PasswordFindEmailWidget(),
                    PasswordFindPhoneWidget(),
                    PasswordFindPhoneVerifyWidget(),
                  ],
                ),
              ),
            ),
            const PasswordFindOutlinedButtonWidget(),
          ],
        ),
      );
}

class PasswordFindEmailWidget extends GetView<FindPasswordController> {
  const PasswordFindEmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.emailController.value,
            focusNode: controller.emailFocusNode.value,
            enabled: controller.isEmailEnabled.value,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                RegExp(
                    r"/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{3,}$/i"),
              ),
            ],
            onFieldSubmitted: (value) =>
                controller.handleEmailOnFieldSubmitted(),
            onChanged: (value) => controller.handleEmailOnChanged(),
            validator: (value) =>
                controller.handleValidator(type: "email", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              hintText: "이메일을 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
}

class PasswordFindPhoneWidget extends GetView<FindPasswordController> {
  const PasswordFindPhoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: controller.phoneController.value,
                    focusNode: controller.phoneFocusNode.value,
                    enabled: controller.isPhoneEnabled.value,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    onFieldSubmitted: (value) => controller.handleProvider(),
                    onChanged: (value) => controller.handlePhoneOnChanged(),
                    validator: (value) =>
                        controller.handleValidator(type: "phone", value: value),
                    style: const TextStyle(color: kTextBodyColor, fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: "휴대전화번호 입력 ('-' 제외)",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 0,
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: OutlinedButton(
                      focusNode: controller.phoneVerifyButtonFocusNode.value,
                      child: Text(
                        "인증번호 전송",
                        style: controller.phoneVerifyButtonTextStyle(),
                      ),
                      onPressed: () => controller.handleProvider(),
                      style: controller.phoneVerifyButtonStyle(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
}

class PasswordFindPhoneVerifyWidget extends GetView<FindPasswordController> {
  const PasswordFindPhoneVerifyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyVisible.value,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: false,
          maintainSemantics: false,
          maintainInteractivity: false,
          child: Column(
            children: [
              TextFormField(
                controller: controller.phoneVerifyController.value,
                focusNode: controller.phoneVerifyFocusNode.value,
                enabled: controller.isPhoneVerifyEnabled.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onFieldSubmitted: (value) =>
                    controller.handlePhoneVerifyOnFieldSubmitted(),
                onChanged: (value) => controller.handlePhoneVerifyOnChanged(),
                validator: (value) => controller.handleValidator(
                    type: "phoneVerify", value: value),
                style: const TextStyle(color: kTextBodyColor, fontSize: 20),
                decoration: const InputDecoration(
                  hintText: "인증번호 6자리",
                  hintStyle: TextStyle(
                    color: Colors.black12,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class PasswordFindOutlinedButtonWidget extends GetView<FindPasswordController> {
  const PasswordFindOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyVisible.value,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: false,
          maintainSemantics: false,
          maintainInteractivity: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
              width: double.infinity,
              height: 70,
              child: OutlinedButton(
                focusNode: controller.findButtonFocusNode.value,
                child: Text(
                  "인증하기",
                  style: controller.findButtonTextStyle(),
                ),
                onPressed: () => controller.handleVerifyProvider(),
                style: controller.findButtonStyle(),
              ),
            ),
          ),
        ),
      );
}
