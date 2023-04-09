import 'package:get/get.dart';
import 'package:zipting/app/controller/event/event_controller.dart';

class EventBinding implements Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<EventController>(() => EventController(), fenix: true);
}
