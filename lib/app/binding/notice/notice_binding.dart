import 'package:get/get.dart';
import 'package:zipting/app/controller/notice/notice_controller.dart';

class NoticeBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<NoticeController>(() => NoticeController(), fenix: true);
}
