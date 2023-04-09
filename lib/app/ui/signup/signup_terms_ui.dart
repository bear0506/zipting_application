import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'package:zipting/app/controller/signup/signup_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class SignUpTermsUi extends GetView<SignUpController> {
  const SignUpTermsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppbarWidget(appBar: AppBar()),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: const [
                      CommentWidget(),
                      TermsAllCheckBoxWidget(),
                      Expanded(
                        flex: 1,
                        child: TermsCheckBoxWidget(),
                      ),
                    ],
                  ),
                ),
                const BottomSheetOutlinedButton(),
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
          onPressed: () => Get.back(),
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
              "집팅에 오신 것을\r\n환영합니다",
              style: TextStyle(
                fontSize: 36,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 70),
        ],
      );
}

class TermsAllCheckBoxWidget extends GetView<SignUpController> {
  const TermsAllCheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            CheckboxListTile(
              focusNode: controller.allCheckBoxFocusNode,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: Text(
                controller.isAllCheckBox["title"],
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: controller.isAllCheckBox["isChecked"],
              activeColor: kPrimaryColor,
              onChanged: (bool? value) {
                controller.isAllCheckBox["isChecked"] = value;

                for (var index = 0;
                    index < controller.isCheckbox.length;
                    index++) {
                  controller.isCheckbox[index]["isChecked"].value = value;
                }
              },
            ),
            const Divider(color: Colors.black12),
          ],
        ),
      );
}

class TermsCheckBoxWidget extends GetView<SignUpController> {
  const TermsCheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
          itemCount: controller.isCheckbox.length,
          itemBuilder: (BuildContext context, int index) => Obx(
            () => CheckboxListTile(
              focusNode: index == 0
                  ? controller.termsCheckBoxFocusNode
                  : controller.privacyCheckBoxFocusNode,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              title: GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: controller.isCheckbox[index]["title"].value,
                    content: Container(
                      padding: const EdgeInsets.all(20),
                      height: 200,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(controller.isCheckbox[index]["content"].value),
                          ],
                        ),
                      ),
                    ),
                    titleStyle: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.isCheckbox[index]["title"].value,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.circle,
                      size: 6,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              value: controller.isCheckbox[index]["isChecked"].value,
              activeColor: kPrimaryColor,
              onChanged: (bool? value) {
                controller.isCheckbox[index]["isChecked"].value = value;

                controller.isCheckbox.every((e) => e["isChecked"].value) == true
                    ? controller.isAllCheckBox["isChecked"] = true
                    : controller.isAllCheckBox["isChecked"] = false;
              },
            ),
          ),
        ),
      );
}

class BottomSheetOutlinedButton extends GetView<SignUpController> {
  const BottomSheetOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            width: double.infinity,
            height: 70,
            child: OutlinedButton(
              focusNode: controller.termsOutlinedButtonFocusNode,
              onPressed: () => controller.outlinedButtonOnPressed(),
              child: Text(
                "다음",
                style: controller.outlinedButtonTextStyle(),
              ),
              style: controller.outlinedButtonStyle(),
            ),
          ),
        ),
      );
}
