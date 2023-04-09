import 'package:intl/intl.dart';

/*
*title*: 매물 상세정보
*description*: 매물 상세정보 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class UserBaseResponseModel {
  late String? status;
  late String? error;
  late Object user = UserResponseModel;
  late List<HouseResponseModel> houses = <HouseResponseModel>[];
  late List<ReviewResponseModel> reviews = <ReviewResponseModel>[];

  UserBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    user = UserResponseModel.fromJson(data["message"]["user"]);
    data["message"]["houses"]
        .map((e) => houses.add(HouseResponseModel.fromJson(e)))
        .toList();
    data["message"]["reviews"]
        .map((e) => reviews.add(ReviewResponseModel.fromJson(e)))
        .toList();
  }
}

class UserResponseModel {
  late int idx;
  late String name;
  late String nickname;
  late String introduce;
  late int points;
  late String photo;
  late bool userCertified;
  late bool houseCertified;
  late bool vaccineCertified;
  late DateTime createdAt;

  UserResponseModel({
    required this.idx,
    required this.name,
    required this.nickname,
    required this.introduce,
    required this.points,
    required this.photo,
    required this.userCertified,
    required this.houseCertified,
    required this.vaccineCertified,
    required this.createdAt,
  });

  UserResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    name = data['name'];
    nickname = data['nickname'];
    introduce = data['introduce'];
    points = data['points'];
    photo = data['photo'];
    userCertified = data['user_certified'];
    houseCertified = data['house_certified'];
    vaccineCertified = data['vaccine_certified'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class HouseResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String start;
  late String end;
  late int point;
  late bool wishlistCheck;
  late List<HouseTagsResponseModel> tags = <HouseTagsResponseModel>[];
  late List<HousePhotosResponseModel> photos = <HousePhotosResponseModel>[];
  late DateTime createdAt;

  HouseResponseModel({
    required this.idx,
    required this.userIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.start,
    required this.end,
    required this.point,
    required this.wishlistCheck,
    required this.createdAt,
  });

  HouseResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    start =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    end = DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    if (data["tags"].length > 0) {
      data["tags"]
          .map((e) => tags.add(HouseTagsResponseModel.fromJson(e)))
          .toList();
    }
    if (data["photos"].length > 0) {
      data["photos"]
          .map((e) => photos.add(HousePhotosResponseModel.fromJson(e)))
          .toList();
    }
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class HouseTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late DateTime createdAt;

  HouseTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  HouseTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class HousePhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  HousePhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  HousePhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class ReviewResponseModel {
  late int idx;
  late int reviewUserIdx;
  late int targetUserIdx;
  late int houseIdx;
  late String content;
  late double rating;
  late String startDate;
  late String endDate;
  late dynamic user = ReviewUserResponseModel;
  late List<ReviewPhotosResponseModel> photos = <ReviewPhotosResponseModel>[];
  late DateTime createdAt;

  ReviewResponseModel({
    required this.idx,
    required this.reviewUserIdx,
    required this.targetUserIdx,
    required this.houseIdx,
    required this.content,
    required this.rating,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
  });

  ReviewResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    reviewUserIdx = data['review_user_idx'];
    targetUserIdx = data['target_user_idx'];
    houseIdx = data['house_idx'];
    content = data['content'];
    rating = data['rating'];
    startDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['start_date'] ?? now));
    endDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['end_date'] ?? now));
    user = ReviewUserResponseModel.fromJson(data["user"]);
    if (data["photos"].length > 0) {
      data["photos"]
          .map((e) => photos.add(ReviewPhotosResponseModel.fromJson(e)))
          .toList();
    }
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class ReviewUserResponseModel {
  late int idx;
  late String name;
  late String nickname;
  late String photo;
  late DateTime createdAt;

  ReviewUserResponseModel({
    required this.idx,
    required this.name,
    required this.nickname,
    required this.photo,
    required this.createdAt,
  });

  ReviewUserResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    name = data['name'];
    nickname = data['nickname'];
    photo = data['photo'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class ReviewPhotosResponseModel {
  late int idx;
  late int reviewIdx;
  late String url;
  late DateTime createdAt;

  ReviewPhotosResponseModel({
    required this.idx,
    required this.reviewIdx,
    required this.url,
    required this.createdAt,
  });

  ReviewPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    reviewIdx = data['review_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}
