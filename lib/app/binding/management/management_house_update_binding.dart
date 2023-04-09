import 'package:get/get.dart';
import 'package:zipting/app/controller/management/management_house_update_controller.dart';

class ManagementHouseUpdateBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<ManageMentHouseUpdateController>(
      () => ManageMentHouseUpdateController(),
      fenix: true);
}
