import 'package:intl/intl.dart';

/*
*title*: 홈
*description*: 홈 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class HomeBaseResponseModel {
  late String? status;
  late String? error;
  late List<HomeBannersResponseModel> banners = <HomeBannersResponseModel>[];
  late List<HomeHouseResponseModel> houses = <HomeHouseResponseModel>[];
  late List<HomeAdvertisedResponseModel> advertisedHouses =
      <HomeAdvertisedResponseModel>[];

  HomeBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data['message']["banners"]
        .map((e) => banners.add(HomeBannersResponseModel.fromJson(e)))
        .toList();
    data['message']["houses"]
        .map((e) => houses.add(HomeHouseResponseModel.fromJson(e)))
        .toList();
    data['message']["advertised_houses"]
        .map((e) =>
            advertisedHouses.add(HomeAdvertisedResponseModel.fromJson(e)))
        .toList();
  }
}

class HomeBannersResponseModel {
  late int idx;
  late String url;
  late DateTime createdAt;

  HomeBannersResponseModel({
    required this.idx,
    required this.url,
    required this.createdAt,
  });

  HomeBannersResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    url = data['url'];
    createdAt = (data['created_at'] != null
        ? DateTime.parse(data['created_at'])
        : null)!;
  }
}

class HomeHouseResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String start;
  late String end;
  late int point;
  late bool wishlistCheck;
  late List<PhotosResponseModel> photos = <PhotosResponseModel>[];
  late DateTime createdAt;

  HomeHouseResponseModel({
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

  HomeHouseResponseModel.fromJson(Map<String, dynamic> data) {
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
    data["photos"]
        .map((e) => photos.add(PhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class HomeAdvertisedResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String start;
  late String end;
  late int point;
  late bool wishlistCheck;
  late List<PhotosResponseModel> photos = <PhotosResponseModel>[];
  late DateTime createdAt;

  HomeAdvertisedResponseModel({
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

  HomeAdvertisedResponseModel.fromJson(Map<String, dynamic> data) {
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
    data["photos"]
        .map((e) => photos.add(PhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class PhotosResponseModel {
  late int idx;
  late int housesIdx;
  late String url;
  late DateTime createdAt;

  PhotosResponseModel({
    required this.idx,
    required this.housesIdx,
    required this.url,
    required this.createdAt,
  });

  PhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    housesIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}
