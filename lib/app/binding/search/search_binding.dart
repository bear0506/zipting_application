import 'package:get/get.dart';
import 'package:zipting/app/controller/search/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
}
