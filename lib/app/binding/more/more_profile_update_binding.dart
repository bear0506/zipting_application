import 'package:get/get.dart';
import 'package:zipting/app/controller/more/more_profile_update_controller.dart';

class MoreProfileUpdateBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MoreProfileUpdateController>(
      () => MoreProfileUpdateController(),
      fenix: true);
}
