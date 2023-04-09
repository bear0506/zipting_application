import 'package:get/get.dart';
import 'package:zipting/app/controller/more/more_privacy_update_controller.dart';

class MorePrivacyUpdateBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MorePrivacyUpdateController>(
      () => MorePrivacyUpdateController(),
      fenix: true);
}
