import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/more/more_password_update_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class MorePasswordUpdateUi extends GetView<MorePasswordUpdateController> {
  const MorePasswordUpdateUi({Key? key}) : super(key: key);

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
                        PasswordWidget(),
                        PasswordReWidget(),
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

class PasswordWidget extends GetView<MorePasswordUpdateController> {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.passwordTextFormFieldController,
            focusNode: controller.passwordTextFormFieldFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            obscureText: controller.isPasswordHideVisible.value,
            autofocus: true,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "password", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            validator: (value) =>
                controller.handleValidator(type: "password", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "비밀번호",
              hintText: "비밀번호를 입력해주세요.",
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

class PasswordReWidget extends GetView<MorePasswordUpdateController> {
  const PasswordReWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.passwordReTextFormFieldController,
            focusNode: controller.passwordReTextFormFieldFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            obscureText: controller.isPasswordReHideVisible.value,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) => controller.handleNextFocusNode(
                type: "passwordRe", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            validator: (value) =>
                controller.handleValidator(type: "passwordRe", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "비밀번호 확인",
              hintText: "비밀번호를 다시 입력해주세요.",
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
    extends GetView<MorePasswordUpdateController> {
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
                globalSnackBarWidget(message: "비밀번호가 수정되었습니다.");
              } else {
                if (controller.globalFormKey.currentState!.validate()) {
                  globalSnackBarWidget(
                      message: "비밀번호 수정에 실패했습니다.\r\n잠시 후 다시 시도해주세요.");
                }
              }
            },
          ),
        ),
      );
}


// class BottomSheetOutlinedButtonWidget
//     extends GetView<MorePasswordUpdateController> {
//   const BottomSheetOutlinedButtonWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Visibility(
//         visible: controller.isoutlinedButtonEnabled.value,
//         child: Obx(
//           () => Container(
//             padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
//             width: double.infinity,
//             height: 70,
//             child: OutlinedButton(
//               focusNode: controller.outlinedButtonFocusNode,
//               onPressed: () {},
//               child: Text(
//                 "수정",
//                 style: controller.outlinedButtonTextStyle(),
//               ),
//               style: controller.outlinedButtonStyle(),
//             ),
//           ),
//         ),
//       );
// }
