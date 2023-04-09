import 'package:get/get.dart';
import 'package:zipting/app/controller/user/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<UserController>(() => UserController(), fenix: true);
}
