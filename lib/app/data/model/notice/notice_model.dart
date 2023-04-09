import 'package:intl/intl.dart';

/*
*title*: 공지사항
*description*: 공지사항 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class NoticesBaseResponseModel {
  late String? status;
  late String? error;
  late List<NoticesResponseModel> notices = <NoticesResponseModel>[];

  NoticesBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["notices"]
        .map((e) => notices.add(NoticesResponseModel.fromJson(e)))
        .toList();
  }
}

class NoticesResponseModel {
  late int idx;
  late String title;
  late String content;
  late String createdAt;

  NoticesResponseModel({
    required this.idx,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  NoticesResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    title = data['title'];
    content = data['content'];
    createdAt = DateFormat("yyyy년 MM월 dd일")
        .format(DateTime.parse(data['created_at'] ?? now));
  }
}
