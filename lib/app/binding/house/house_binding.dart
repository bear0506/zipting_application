import 'package:get/get.dart';
import 'package:zipting/app/controller/house/house_controller.dart';

class HouseBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<HouseController>(() => HouseController(), fenix: true);
}
