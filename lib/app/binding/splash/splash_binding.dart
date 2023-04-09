import 'package:get/get.dart';
import 'package:zipting/app/controller/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
