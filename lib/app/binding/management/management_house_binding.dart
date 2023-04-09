import 'package:get/get.dart';
import 'package:zipting/app/controller/management/management_house_controller.dart';

class ManagementHouseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageMentHouseController>(() => ManageMentHouseController(),
        fenix: true);
  }
}
