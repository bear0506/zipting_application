import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/signup/signup_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_dialog_widget.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class SignUpPasswordUi extends GetView<SignUpController> {
  SignUpPasswordUi({Key? key}) : super(key: key);

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
                                PasswordWidget(globalFormKey: _globalFormKey),
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
              "가입의 마지막\r\n단계 입니다!",
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

class PasswordWidget extends GetView<SignUpController> {
  const PasswordWidget({Key? key, required this.globalFormKey})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final globalFormKey;

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            TextFormField(
              controller: controller.passwordTextFormFieldController,
              focusNode: controller.passwordTextFormFieldFocusNode,
              enabled: controller.isPasswordTextFormFieldEnabled.value,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              autofocus: true,
              obscureText: controller.isPasswordHideVisible.value,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(20),
              ],
              onFieldSubmitted: (value) =>
                  controller.handlePasswordOnFieldSubmitted(value: value),
              onChanged: (value) => controller.handlePasswordOnChanged(
                  globalFormKey: globalFormKey),
              validator: (value) => controller.handlePasswordValidator(
                  type: "password", value: value),
              style: const TextStyle(color: kTextBodyColor, fontSize: 20),
              decoration: InputDecoration(
                hintText: "비밀번호를 입력해주세요.",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordHideVisible.value =
                      !controller.isPasswordHideVisible.value,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  icon: Icon(controller.isPasswordHideVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: controller.passwordReTextFormFieldController,
              focusNode: controller.passwordReTextFormFieldFocusNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              enabled: controller.isPasswordReTextFormFieldEnabled.value,
              obscureText: controller.isPasswordReHideVisible.value,
              inputFormatters: <TextInputFormatter>[
                // FilteringTextInputFormatter.deny(pwRegExp),
                LengthLimitingTextInputFormatter(20),
              ],
              onFieldSubmitted: (value) => controller.handlePasswordProvider(),
              onChanged: (value) => controller.handlePasswordReOnChanged(
                  globalFormKey: globalFormKey, value: value),
              validator: (value) => controller.handlePasswordValidator(
                  type: "passwordRe", value: value),
              style: const TextStyle(color: kTextBodyColor, fontSize: 20),
              decoration: InputDecoration(
                hintText: "비밀번호를 다시 입력해주세요.",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordReHideVisible.value =
                      !controller.isPasswordReHideVisible.value,
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                  icon: Icon(
                    controller.isPasswordReHideVisible.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
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
              focusNode: controller.passwordOutlinedButtonFocusNode,
              onPressed: () => controller.handlePasswordProvider(),
              child: Text(
                "회원가입",
                style: controller.passwordOutlinedButtonTextStyle(),
              ),
              style: controller.passwordOutlinedButtonStyle(),
            ),
          ),
        ),
      );
}
