import 'package:get/get.dart';
import 'package:zipting/app/controller/signup/signup_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
