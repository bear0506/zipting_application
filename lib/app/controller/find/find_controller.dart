import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/find/find_email_controller.dart';
import 'package:zipting/app/controller/find/find_password_controller.dart';

class FindController extends GetxController {
  final Rx<FocusScopeNode> currentFocus = FocusScopeNode().obs;

  // 로더
  RxBool isLoadervisible = false.obs;

  // ===== 탭바 =====
  void tabBarOnTabAction({required int value}) => value == 0
      ? Get.find<FindEmailController>().nameFocusNode.value.requestFocus()
      : Get.find<FindPasswordController>().emailFocusNode.value.requestFocus();

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
