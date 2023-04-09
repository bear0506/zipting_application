import 'package:get/get.dart';
import 'package:zipting/app/controller/house/house_mutual_trade_controller.dart';

class HouseMutualTradeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HouseMutualTradeController());
  }
}
