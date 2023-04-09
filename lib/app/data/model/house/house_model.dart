import 'package:intl/intl.dart';

/*
*title*: 매물 상세정보
*description*: 매물 상세정보 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class HouseBaseResponseModel {
  late String? status;
  late String? error;
  late Object houses = HouseResponseModel;
  late List<ReviewResponseModel> reviews = <ReviewResponseModel>[];

  HouseBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    houses = HouseResponseModel.fromJson(data["message"]["houses"]);
    data["message"]["reviews"]
        .map((e) => reviews.add(ReviewResponseModel.fromJson(e)))
        .toList();
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

  late dynamic houseTradeIdx;
  late String houseType;
  late String contractType;
  late int preferTradeType;
  late int roomCount;
  late int bedCount;
  late int bathRoomCount;
  late int acreage;
  late bool advertiseHouse;
  late bool wishlistCheck;
  late Object user = HouseUserResponseModel;
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
    required this.houseTradeIdx,
    required this.houseType,
    required this.contractType,
    required this.preferTradeType,
    required this.roomCount,
    required this.bedCount,
    required this.bathRoomCount,
    required this.acreage,
    required this.advertiseHouse,
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

    houseTradeIdx = data['house_trade_idx'];
    houseType = data['house_type'] ?? "아파트";
    contractType = data['contract_type'] ?? "자가";
    preferTradeType = data['prefer_trade_type'] ?? 0;
    roomCount = data['room_count'] ?? 1;
    bedCount = data['bed_count'] ?? 1;
    bathRoomCount = data['bath_room_count'] ?? 1;
    acreage = data['acreage'] ?? 0;
    advertiseHouse = data['advertise_house'] ?? false;

    wishlistCheck = data['wishlist_check'] ?? false;
    user = HouseUserResponseModel.fromJson(data["user"]);
    data["tags"]
        .map((e) => tags.add(HouseTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(HousePhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class HouseUserResponseModel {
  late int idx;
  late String name;
  late String nickname;
  late String photo;
  late DateTime createdAt;

  HouseUserResponseModel({
    required this.idx,
    required this.name,
    required this.nickname,
    required this.photo,
    required this.createdAt,
  });

  HouseUserResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    name = data['name'];
    nickname = data['nickname'];
    photo = data['photo'];
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
    content = data['content'] ?? "내용";
    rating = data['rating'] ?? 0.0;
    startDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['start_date'] ?? now));
    endDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['end_date'] ?? now));
    user = ReviewUserResponseModel.fromJson(data["user"]);
    data["photos"]
        .map((e) => photos.add(ReviewPhotosResponseModel.fromJson(e)))
        .toList();
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
