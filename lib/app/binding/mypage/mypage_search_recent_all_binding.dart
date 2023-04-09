import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_search_recent_all_controller.dart';

class MyPageSearchRecentAllBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MyPageSearchRecentAllController>(
      () => MyPageSearchRecentAllController(),
      fenix: true);
}
