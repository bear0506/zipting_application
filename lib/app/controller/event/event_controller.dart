import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/data/model/event/event_model.dart';
import 'package:zipting/app/data/provider/event/event_provider.dart';
import 'package:zipting/main.dart';

class EventController extends GetxController {
  late RxList<EventsResponseModel> events = <EventsResponseModel>[].obs;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await EventsProvider().dio().then((value) {
        if (value.status == "success") {
          events.assignAll(value.events);
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
