import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/more/more_profile_update_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class MoreProfileUpdateUi extends GetView<MoreProfileUpdateController> {
  const MoreProfileUpdateUi({Key? key}) : super(key: key);

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
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppbarWidget(appBar: AppBar()),
              body: SafeArea(
                child: Form(
                  key: controller.globalFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: ListView(
                      children: const [
                        ImagesWidget(),
                        NickNameWidget(),
                        IntroduceWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet: const BottomSheetOutlinedButtonWidget(),
            ),
            customLoaderWidget(
                isLoaderisible: controller.isLoaderVisible.value),
          ],
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

class ImagesWidget extends GetView<MoreProfileUpdateController> {
  const ImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onTap: () => controller.handleSelectImage(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: Get.width,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imageList.length,
                      itemBuilder: (BuildContext _, int index) => Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: controller.imageList[index]["type"] ==
                                        "local"
                                    ? Image.file(File(
                                        controller.imageList[index]["path"]))
                                    : Image.network(
                                        controller.imageList[index]["path"],
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            onTap: () =>
                                controller.handleImageDelete(index: index),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            globalDividerWidget(),
          ],
        ),
      );
}

class NickNameWidget extends GetView<MoreProfileUpdateController> {
  const NickNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.nicknameTextFormFieldController,
            focusNode: controller.nicknameTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "nickname", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            validator: (value) =>
                controller.handleValidator(type: "nickname", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "닉네임",
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

class IntroduceWidget extends GetView<MoreProfileUpdateController> {
  const IntroduceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.introduceTextFormFieldController,
            focusNode: controller.introduceTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            validator: (value) =>
                controller.handleValidator(type: "introduce", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "introduce", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "자기소개",
              hintText: "자기소개를 입력해주세요.",
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

class BottomSheetOutlinedButtonWidget
    extends GetView<MoreProfileUpdateController> {
  const BottomSheetOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
          width: double.infinity,
          height: 70,
          child: OutlinedButton(
            focusNode: controller.outlinedButtonFocusNode,
            child: Text(
              "수정",
              style: controller.outlinedButtonTextStyle(),
            ),
            style: controller.outlinedButtonStyle(),
            onPressed: () async {
              await controller.handleUpdateProvider();

              if (controller.isUpdateProvider.value) {
                Get.back();
                globalSnackBarWidget(message: "내 정보가 수정되었습니다.");
              } else {
                if (controller.globalFormKey.currentState!.validate()) {
                  globalSnackBarWidget(
                      message: controller.reqeustMessage.value);
                }
              }
            },
          ),
        ),
      );
}
