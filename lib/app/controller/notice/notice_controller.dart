import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/data/model/notice/notice_model.dart';
import 'package:zipting/app/data/provider/notice/notice_provider.dart';
import 'package:zipting/main.dart';

class NoticeController extends GetxController {
  late RxList<NoticesResponseModel> notices = <NoticesResponseModel>[].obs;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await NoticesProvider().dio().then((value) {
        if (value.status == "success") {
          notices.assignAll(value.notices);
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(const Duration(milliseconds: 100),
          () => isShimmerVisible.value = false);
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
