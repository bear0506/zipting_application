import 'package:intl/intl.dart';

/*
*title*: 내집관리 상세정보
*description*: 내집관리 상세정보 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class ManagementHouseBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  ManagementHouseBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class ManagementHouseReadBaseResponseModel {
  late String? status;
  late String? error;
  late List<ManagementHouseReadResponseModel> houses =
      <ManagementHouseReadResponseModel>[];

  ManagementHouseReadBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["houses"]
        .map((e) => houses.add(ManagementHouseReadResponseModel.fromJson(e)))
        .toList();
  }
}

class ManagementHouseTargetReadBaseResponseModel {
  late String? status;
  late String? error;
  late Object houses = ManagementHouseReadResponseModel;

  ManagementHouseTargetReadBaseResponseModel.fromJson(
      Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    houses =
        ManagementHouseReadResponseModel.fromJson(data["message"]["houses"]);
  }
}

class ManagementHouseReadResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late double lat;
  late double lon;
  late int point;
  late int preferTradeType;
  late String houseType;
  late String contractType;
  late int roomCount;
  late int bedCount;
  late int bathRoomCount;
  late int acreage;
  late bool advertiseHouse;
  late bool wishlistCheck;
  late String startedAt;
  late String endedAt;
  late String startedAt2;
  late String endedAt2;
  late String startedAt3;
  late String endedAt3;
  late List<ManagementHouseTagsResponseModel> tags =
      <ManagementHouseTagsResponseModel>[];
  late List<ManagementHousePhotosResponseModel> photos =
      <ManagementHousePhotosResponseModel>[];
  late String createdAt;

  ManagementHouseReadResponseModel({
    required this.idx,
    required this.userIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.lat,
    required this.lon,
    required this.point,
    required this.preferTradeType,
    required this.houseType,
    required this.contractType,
    required this.roomCount,
    required this.bedCount,
    required this.bathRoomCount,
    required this.acreage,
    required this.advertiseHouse,
    required this.wishlistCheck,
    required this.startedAt,
    required this.endedAt,
    required this.createdAt,
    required this.startedAt2,
    required this.endedAt2,
    required this.startedAt3,
    required this.endedAt3,
  });

  ManagementHouseReadResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    lat = data['lat'] ?? 0.0;
    lon = data['lon'] ?? 0.0;
    point = data['point'] ?? 0;
    preferTradeType = data['prefer_trade_type'] ?? 0;
    houseType = data['house_type'] ?? "매물 타입";
    contractType = data['contract_type'] ?? "계약 타입";
    roomCount = data['room_count'] ?? 0;
    bedCount = data['bed_count'] ?? 0;
    bathRoomCount = data['bath_room_count'] ?? 0;
    acreage = data['acreage'] ?? 0;
    advertiseHouse = data['advertise_house'] ?? false;
    wishlistCheck = data['wishlist_check'] ?? false;
    startedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    endedAt =
        DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    startedAt2 = DateFormat("yyyy.MM.dd")
        .format(DateTime.parse(data['started_at'] ?? now));
    endedAt2 = DateFormat("yyyy.MM.dd")
        .format(DateTime.parse(data['ended_at'] ?? now));
    startedAt3 = data['started_at'] ?? now;
    endedAt3 = data['ended_at'] ?? now;
    data["tags"]
        .map((e) => tags.add(ManagementHouseTagsResponseModel.fromJson(e)))
        .toList();
    data["photos"]
        .map((e) => photos.add(ManagementHousePhotosResponseModel.fromJson(e)))
        .toList();
    createdAt = DateFormat("yyyy년 MM월 dd일 H:m:s")
        .format(DateTime.parse(data['created_at'] ?? now));
  }
}

class ManagementHouseTagsResponseModel {
  late int idx;
  late int housesIdx;
  late String tag;
  late String createdAt;

  ManagementHouseTagsResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.tag,
    required this.createdAt,
  });

  ManagementHouseTagsResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    tag = data['tag'];
    createdAt = DateFormat("yyyy년 MM월 dd일 H:m:s")
        .format(DateTime.parse(data['created_at'] ?? now));
  }
}

class ManagementHousePhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late String createdAt;

  ManagementHousePhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  ManagementHousePhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt = DateFormat("yyyy년 MM월 dd일 H:m:s")
        .format(DateTime.parse(data['created_at'] ?? now));
  }
}

class ManagementHouseCreateRequestModel {
  dynamic images;
  String? title;
  String? content;
  String? address;
  int? point;
  String? houseType;
  String? contractType;
  int? roomCount;
  int? bedCount;
  int? bathRoomCount;
  int? acreage;
  DateTime? startedAt;
  DateTime? endedAt;

  ManagementHouseCreateRequestModel({
    required dynamic images,
    required String title,
    required String content,
    required String address,
    required int point,
    required String houseType,
    required String contractType,
    required int roomCount,
    required int bedCount,
    required int bathRoomCount,
    required int acreage,
    required DateTime startedAt,
    required DateTime endedAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "images": images,
      "title": title,
      "content": content,
      "address": address,
      "point": point,
      "house_type": houseType,
      "contract_type": contractType,
      "room_count": roomCount,
      "bed_count": bedCount,
      "bath_room_count": bathRoomCount,
      "acreage": acreage,
      "started_at": startedAt!.toIso8601String(),
      "ended_at": endedAt!.toIso8601String(),
    };

    return map;
  }
}

class ManagementHouseUpdateRequestModel {
  dynamic images;
  String? title;
  String? content;
  String? address;
  int? point;
  String? houseType;
  String? contractType;
  int? roomCount;
  int? bedCount;
  int? bathRoomCount;
  int? acreage;
  DateTime? startedAt;
  DateTime? endedAt;

  ManagementHouseUpdateRequestModel({
    required dynamic images,
    required String title,
    required String content,
    required String address,
    required int point,
    required String houseType,
    required String contractType,
    required int roomCount,
    required int bedCount,
    required int bathRoomCount,
    required int acreage,
    required DateTime startedAt,
    required DateTime endedAt,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "images": images,
      "title": title,
      "content": content,
      "address": address,
      "point": point,
      "house_type": houseType,
      "contract_type": contractType,
      "room_count": roomCount,
      "bed_count": bedCount,
      "bath_room_count": bathRoomCount,
      "acreage": acreage,
      "started_at": startedAt!.toIso8601String(),
      "ended_at": endedAt!.toIso8601String(),
    };

    return map;
  }
}
