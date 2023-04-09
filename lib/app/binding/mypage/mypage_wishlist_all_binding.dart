import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_wishlist_all_controller.dart';

class MyPageWishlistAllBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MyPageWishListAllController>(
      () => MyPageWishListAllController(),
      fenix: true);
}
