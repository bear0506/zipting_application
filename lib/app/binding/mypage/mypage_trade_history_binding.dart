import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_trade_history_controller.dart';

class MyPageTradeHistoryBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<MyPageTradeHistoryController>(
      () => MyPageTradeHistoryController(),
      fenix: true);
}
