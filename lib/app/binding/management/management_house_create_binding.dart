import 'package:get/get.dart';
import 'package:zipting/app/controller/management/management_house_create_controller.dart';

class ManagementHouseCreateBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<ManageMentHouseCreateController>(
      () => ManageMentHouseCreateController(),
      fenix: true);
}
