import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/home/home_controller.dart';
import 'package:zipting/app/data/model/management/management_house_model.dart';
import 'package:zipting/app/data/provider/management/management_house_provider.dart';
import 'package:zipting/main.dart';

class ManageMentHouseController extends GetxController {
  late RxList<ManagementHouseReadResponseModel> houses =
      <ManagementHouseReadResponseModel>[].obs;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await ManagementHouseReadProvider().dio().then((value) {
        if (value.status == "success") {
          houses.assignAll(value.houses);
          houses.refresh();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(const Duration(milliseconds: 500),
          () => isShimmerVisible.value = false);
    }
  }

  // 삭제
  Future<void> handleDeleteProvider({required int houseIdx}) async {
    try {
      await ManagementHouseDeleteProvider()
          .dio(houseIdx: houseIdx)
          .then((value) {
        if (value.status == "success") {
          handleInitProvider();
          Get.find<HomeController>().handleInitProvider();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    handleInitProvider();

    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
