import 'package:get/get.dart';
import 'package:zipting/app/controller/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}
