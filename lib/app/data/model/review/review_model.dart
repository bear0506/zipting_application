import 'package:intl/intl.dart';

/*
*title*: 리뷰 모두보기
*description*: 리뷰 모두보기 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class ReviewAllBaseResponseModel {
  late String? status;
  late String? error;
  late List<ReviewAllResponseModel> reviews = <ReviewAllResponseModel>[];

  ReviewAllBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["reviews"]
        .map((e) => reviews.add(ReviewAllResponseModel.fromJson(e)))
        .toList();
  }
}

class ReviewAllResponseModel {
  late int idx;
  late int reviewUserIdx;
  late int targetUserIdx;
  late String content;
  late double rating;
  late String startDate;
  late String endDate;
  late dynamic user = ReviewAllUserResponseModel;
  late List<ReviewAllPhotosResponseModel> photos =
      <ReviewAllPhotosResponseModel>[];
  late DateTime createdAt;

  ReviewAllResponseModel({
    required this.idx,
    required this.reviewUserIdx,
    required this.targetUserIdx,
    required this.content,
    required this.rating,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
  });

  ReviewAllResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    reviewUserIdx = data['review_user_idx'];
    targetUserIdx = data['target_user_idx'];
    content = data['content'] ?? "내용";
    rating = data['rating'] ?? 0.0;
    startDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['start_date'] ?? now));
    endDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['end_date'] ?? now));
    user = ReviewAllUserResponseModel.fromJson(data["user"]);
    data["photos"]
        .map((e) => photos.add(ReviewAllPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class ReviewAllUserResponseModel {
  late int idx;
  late String name;
  late String nickname;
  late String photo;
  late DateTime createdAt;

  ReviewAllUserResponseModel({
    required this.idx,
    required this.name,
    required this.nickname,
    required this.photo,
    required this.createdAt,
  });

  ReviewAllUserResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    name = data['name'];
    nickname = data['nickname'];
    photo = data['photo'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class ReviewAllPhotosResponseModel {
  late int idx;
  late int reviewIdx;
  late String url;
  late DateTime createdAt;

  ReviewAllPhotosResponseModel({
    required this.idx,
    required this.reviewIdx,
    required this.url,
    required this.createdAt,
  });

  ReviewAllPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    reviewIdx = data['review_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}
