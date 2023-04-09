import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/signup/signup_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_dialog_widget.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class SignUpPhoneUi extends GetView<SignUpController> {
  SignUpPhoneUi({Key? key}) : super(key: key);

  final _globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.currentFocus = FocusScope.of(context);

          if (!controller.currentFocus.hasPrimaryFocus &&
              controller.currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: WillPopScope(
          onWillPop: () => controller.handleWillPopScopeAction(),
          child: Obx(
            () => Stack(
              children: [
                Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: AppbarWidget(appBar: AppBar()),
                  body: SafeArea(
                    child: Form(
                      key: _globalFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(40),
                            child: ListView(
                              children: [
                                const CommentWidget(),
                                NameWidget(globalFormKey: _globalFormKey),
                                PhoneWidget(globalFormKey: _globalFormKey),
                                PhoneVerifyWidget(
                                    globalFormKey: _globalFormKey),
                              ],
                            ),
                          ),
                          const BottomOutlinedButtonWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                customLoaderWidget(
                    isLoaderisible: controller.isLoaderVisible.value),
              ],
            ),
          ),
        ),
      );
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45, size: 32),
          tooltip: "뒤로가기",
          onPressed: () => globalWillPopScopeDialogWidget(),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: const [
          SizedBox(height: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "핸드폰 인증을\r\n진행해주세요!",
              style: TextStyle(
                fontSize: 32,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      );
}

class NameWidget extends GetView<SignUpController> {
  const NameWidget({Key? key, required this.globalFormKey}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.nameTextFormFieldController,
            focusNode: controller.nameTextFormFieldFocusNode,
            enabled: controller.isNameTextFormFieldEnabled.value,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            autofocus: true,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(8),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNameOnFieldSubmitted(value: value),
            onChanged: (value) => controller.handleNameOnChanged(
                globalFormKey: globalFormKey, value: value),
            validator: (value) =>
                controller.handlePhoneValidator(type: "name", value: value),
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
      );
}

class PhoneWidget extends GetView<SignUpController> {
  const PhoneWidget({Key? key, required this.globalFormKey}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: controller.phoneTextFormFieldController,
                  focusNode: controller.phoneTextFormFieldFocusNode,
                  enabled: controller.isPhoneTextFormFieldEnabled.value,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.go,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  onFieldSubmitted: (value) => controller.handlePhoneProvider(),
                  onChanged: (value) => controller.handlePhoneOnChanged(
                      globalFormKey: globalFormKey, value: value),
                  validator: (value) => controller.handlePhoneValidator(
                      type: "phone", value: value),
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
                  child: Obx(
                    () => OutlinedButton(
                      focusNode: controller.phoneOutlinedButtonFocusNode,
                      child: Text(
                        "인증번호 전송",
                        style: controller.phoneOutlinedButtonTextStyle(),
                      ),
                      onPressed: () => controller.handlePhoneProvider(),
                      style: controller.phoneOutlinedButtonStyle(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
}

class PhoneVerifyWidget extends GetView<SignUpController> {
  const PhoneVerifyWidget({Key? key, required this.globalFormKey})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyTextFormFieldVisible.value,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: false,
          maintainSemantics: false,
          maintainInteractivity: false,
          child: Column(
            children: [
              TextFormField(
                controller: controller.phoneVerifyTextFormFieldController,
                focusNode: controller.phoneVerifyTextFormFieldFocusNode,
                enabled: controller.isPhoneVerifyTextFormFieldEnabled.value,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                onFieldSubmitted: (value) =>
                    controller.handlePhoneVerifyProvider(),
                onChanged: (value) => controller.handlePhoneVerifyOnChanged(
                    globalFormKey: globalFormKey, value: value),
                validator: (value) => controller.handlePhoneValidator(
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

class BottomOutlinedButtonWidget extends GetView<SignUpController> {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Visibility(
          visible: controller.isPhoneVerifyTextFormFieldVisible.value,
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
                focusNode: controller.phoneVerifyOutlinedButtonFocusNode,
                child: Text(
                  "인증하기",
                  style: controller.phoneVerifyOutlinedButtonTextStyle(),
                ),
                onPressed: () => controller.handlePhoneVerifyProvider(),
                style: controller.phoneVerifyOutlinedButtonStyle(),
              ),
            ),
          ),
        ),
      );
}
