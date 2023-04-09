import 'package:get/get.dart';
import 'package:zipting/app/controller/qna/qna_controller.dart';

class QnaBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<QnaController>(() => QnaController(), fenix: true);
}
