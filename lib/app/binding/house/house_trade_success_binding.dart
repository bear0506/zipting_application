import 'package:get/get.dart';
import 'package:zipting/app/controller/house/house_trade_success_controller.dart';

class HouseTradeSuccessBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HouseTradeSuccessController());
  }
}
