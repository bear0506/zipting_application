import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zipting/app/data/provider/splash/splash_provider.dart';
import 'package:zipting/main.dart';

class SplashController extends GetxController {
  RxString image = 'assets/icons/logo_white.png'.obs;

  // 스토리지에서 토큰 체크
  Future<void> handleInit() async {
    if (GetStorage().read("token") == null) {
      handleGetTo(status: false);
    } else {
      await handleInitProvider();
    }
  }

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await SplashInitProvider().dio().then((value) async {
        if (value.status == "success") {
          handleGetTo(status: true);
        } else {
          logger.d(value.message);
          handleGetTo(status: false);
        }
      });
    } catch (e) {
      logger.d(e);
      handleGetTo(status: false);
    }
  }

  void handleGetTo({required bool status}) => Future.delayed(
      const Duration(milliseconds: 1000),
      () => status == true
          ? Get.offAndToNamed("/main")
          : Get.offAndToNamed("/signin"));

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    await handleInit();

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
