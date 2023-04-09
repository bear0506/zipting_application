import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_trade_controller.dart';

class MyPageTradeAllBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<MyPageTradeAllController>(() => MyPageTradeAllController(),
          fenix: true);
}
