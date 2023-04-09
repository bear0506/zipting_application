import 'package:intl/intl.dart';

/*
*title*: 현재 교환 상태
*description*: 현재 교환 상태 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MyPageTradeBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  MyPageTradeBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class MyPageTradeAllBaseResponseModel {
  late String? status;
  late String? error;
  late List<MyPageTradeAllResponseModel> trades =
      <MyPageTradeAllResponseModel>[];

  MyPageTradeAllBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["trades"]
        .map((e) => trades.add(MyPageTradeAllResponseModel.fromJson(e)))
        .toList();
  }
}

class MyPageTradeAllResponseModel {
  late int idx;
  late int userIdx;
  late int houseTradeIdx;
  late String title;
  late String content;
  late String address;
  late String startedAt;
  late String endedAt;
  late int point;
  late bool wishlistCheck;
  late dynamic tradeIdx;
  late String tradeStatus;
  late List<MyPageTradeAllTagsResponseModel> tags =
      <MyPageTradeAllTagsResponseModel>[];
  late List<MyPageTradeAllPhotosResponseModel> photos =
      <MyPageTradeAllPhotosResponseModel>[];
  late DateTime createdAt;

  MyPageTradeAllResponseModel({
    required this.idx,
    required this.userIdx,
    required this.houseTradeIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.startedAt,
    required this.endedAt,
    required this.point,
    required this.wishlistCheck,
    required this.tradeIdx,
    required this.tradeStatus,
    required this.tags,
    required this.photos,
    required this.createdAt,
  });

  MyPageTradeAllResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    houseTradeIdx = data['house_trade_idx'] ?? 0;
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    startedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    endedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    tradeIdx = data['trade_idx'] ?? false;
    tradeStatus = data['trade_status'];
    data["tags"]
        .map((e) => tags.add(MyPageTradeAllTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(MyPageTradeAllPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageTradeAllTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late DateTime createdAt;

  MyPageTradeAllTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  MyPageTradeAllTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageTradeAllPhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  MyPageTradeAllPhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  MyPageTradeAllPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageTradeRequestModel {
  late dynamic type;
  late int tradeIdx;
  late int houseIdx;

  MyPageTradeRequestModel({
    type,
    tradeIdx,
    houseIdx,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "type": type,
      "trade_idx": tradeIdx,
      "house_idx": houseIdx,
    };
    return map;
  }
}
