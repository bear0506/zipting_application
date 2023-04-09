import 'package:get/get.dart';
import 'package:zipting/app/controller/review/review_all_controller.dart';

class ReviewAllBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<ReviewAllController>(() => ReviewAllController(),
          fenix: true);
}
