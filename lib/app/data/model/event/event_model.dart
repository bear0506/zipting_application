import 'package:intl/intl.dart';

/*
*title*: 이벤트
*description*: 이벤트 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class EventsBaseResponseModel {
  late String? status;
  late String? error;
  late List<EventsResponseModel> events = <EventsResponseModel>[];

  EventsBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["events"]
        .map((e) => events.add(EventsResponseModel.fromJson(e)))
        .toList();
  }
}

class EventsResponseModel {
  late int idx;
  late String title;
  late String content;
  late String createdAt;

  EventsResponseModel({
    required this.idx,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  EventsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    title = data['title'];
    content = data['content'];
    createdAt = DateFormat("yyyy년 MM월 dd일")
        .format(DateTime.parse(data['created_at'] ?? now));
  }
}
