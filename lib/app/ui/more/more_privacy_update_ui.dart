import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/more/more_privacy_update_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class MorePrivacyUpdateUi extends GetView<MorePrivacyUpdateController> {
  const MorePrivacyUpdateUi({Key? key}) : super(key: key);

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
                        EmailWidget(),
                        NameWidget(),
                        PhoneWidget(),
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

class EmailWidget extends GetView<MorePrivacyUpdateController> {
  const EmailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.emailTextFormFieldController,
            focusNode: controller.emailTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            enabled: false,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "email", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            validator: (value) =>
                controller.handleValidator(type: "email", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "이메일",
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

class NameWidget extends GetView<MorePrivacyUpdateController> {
  const NameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.nameTextFormFieldController,
            focusNode: controller.nameTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            enabled: false,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            validator: (value) =>
                controller.handleValidator(type: "name", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "name", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "성함",
              hintText: "성함을 입력해주세요.",
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

class PhoneWidget extends GetView<MorePrivacyUpdateController> {
  const PhoneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.phoneTextFormFieldController,
            focusNode: controller.phoneTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            enabled: false,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            validator: (value) =>
                controller.handleValidator(type: "phone", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "phone", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "핸드폰 번호",
              hintText: "핸드폰 번호를 입력해주세요.",
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

class BottomSheetOutlinedButtonWidget
    extends GetView<MorePrivacyUpdateController> {
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
            onPressed: () => Get.dialog(
              const Dialog(
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                        "정확한 인증정보를 위해\r\n개인정보를 수정하기 위해서는\r\n1:1 문의 및 고객센터로 문의해주세요."),
                  ),
                ),
              ),
            ),
            // onPressed: () async {
            //   await controller.handleUpdateProvider();

            //   if (controller.isUpdateProvider.value) {
            //     Get.back();
            //     globalSnackBarWidget(message: "내 개인정보가 수정되었습니다.");
            //   } else {
            //     if (controller.globalFormKey.currentState!.validate()) {
            //       globalSnackBarWidget(
            //           message: controller.reqeustMessage.value);
            //     }
            //   }
            // },
          ),
        ),
      );
}
