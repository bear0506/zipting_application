import 'package:get/get.dart';
import 'package:zipting/app/controller/house/house_all_controller.dart';

class HouseAllBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HouseAllController>(() => HouseAllController(), fenix: true);
  }
}
