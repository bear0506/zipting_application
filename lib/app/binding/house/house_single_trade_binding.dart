import 'package:get/get.dart';
import 'package:zipting/app/controller/house/house_single_trade_controller.dart';

class HouseSingleTradeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HouseSingleTradeController());
  }
}
