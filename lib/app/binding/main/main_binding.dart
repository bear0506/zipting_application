import 'package:get/get.dart';
import 'package:zipting/app/controller/home/home_controller.dart';
import 'package:zipting/app/controller/main/main_controller.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';
import 'package:zipting/app/controller/search/search_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<MainController>(() => MainController(), fenix: true);
    // Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    // Get.lazyPut<MyPageController>(() => MyPageController(), fenix: true);
    // Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(MyPageController());
    Get.put(SearchController());
  }
}
