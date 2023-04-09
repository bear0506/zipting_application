import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyPageController());
  }
}
