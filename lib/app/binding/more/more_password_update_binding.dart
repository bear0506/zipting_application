import 'package:get/get.dart';
import 'package:zipting/app/controller/more/more_password_update_controller.dart';

class MorePasswordUpdateBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MorePasswordUpdateController>(
      () => MorePasswordUpdateController(),
      fenix: true);
}
