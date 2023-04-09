import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/signup/signup_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_dialog_widget.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class SignUpInfoUi extends GetView<SignUpController> {
  SignUpInfoUi({Key? key}) : super(key: key);

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
                                NickNameWidget(globalFormKey: _globalFormKey),
                                EmailWidget(globalFormKey: _globalFormKey),
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
              "사용하실 닉네임과\r\n이메일을 입력해주세요.",
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

class NickNameWidget extends GetView<SignUpController> {
  const NickNameWidget({Key? key, required this.globalFormKey})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.nickNameTextFormFieldController,
            focusNode: controller.nickNameTextFormFieldFocusNode,
            enabled: controller.isNickNameTextFormFieldEnabled.value,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            autofocus: true,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                  RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣0-9a-zA-Z]')),
              LengthLimitingTextInputFormatter(6),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNickNameOnFieldSubmitted(value: value),
            onChanged: (value) => controller.handleNickNameOnChanged(
                globalFormKey: globalFormKey, value: value),
            validator: (value) =>
                controller.handleInfoValidator(type: "nickname", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              hintText: "닉네임을 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}

class EmailWidget extends GetView<SignUpController> {
  const EmailWidget({Key? key, required this.globalFormKey}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            TextFormField(
              controller: controller.emailTextFormFieldController,
              focusNode: controller.emailTextFormFieldFocusNode,
              enabled: controller.isEmailTextFormFieldEnabled.value,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(
                      r"/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{3,}$/i"),
                ),
              ],
              onFieldSubmitted: (value) => controller.handleInfoProvider(),
              onChanged: (value) => controller.handleEmailOnChanged(
                  globalFormKey: globalFormKey, value: value),
              validator: (value) =>
                  controller.handleInfoValidator(type: "email", value: value),
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
          ],
        ),
      );
}

class BottomOutlinedButtonWidget extends GetView<SignUpController> {
  const BottomOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            width: double.infinity,
            height: 70,
            child: OutlinedButton(
              focusNode: controller.infoOutlinedButtonFocusNode,
              onPressed: () => controller.handleInfoProvider(),
              child: Text(
                "다음",
                style: controller.infoOutlinedButtonTextStyle(),
              ),
              style: controller.infoOutlinedButtonStyle(),
            ),
          ),
        ),
      );
}
