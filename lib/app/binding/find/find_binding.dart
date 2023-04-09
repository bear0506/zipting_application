import 'package:get/get.dart';
import 'package:zipting/app/controller/find/find_controller.dart';
import 'package:zipting/app/controller/find/find_email_controller.dart';
import 'package:zipting/app/controller/find/find_password_controller.dart';

class FindBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindController>(() => FindController(), fenix: true);
    Get.lazyPut<FindEmailController>(() => FindEmailController(), fenix: true);
    Get.lazyPut<FindPasswordController>(() => FindPasswordController(),
        fenix: true);
  }
}
