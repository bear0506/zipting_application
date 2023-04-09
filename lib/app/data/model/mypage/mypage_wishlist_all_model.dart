import 'package:intl/intl.dart';

/*
*title*: 마이페이지 찜 목록 모두보기
*description*: 마이페이지 찜 목록 모두보기 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MyPageWishlistAllBaseResponseModel {
  late String? status;
  late String? error;
  late List<MyPageWishlistAllResponseModel> houses =
      <MyPageWishlistAllResponseModel>[];

  MyPageWishlistAllBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    data["message"]["houses"]
        .map((e) => houses.add(MyPageWishlistAllResponseModel.fromJson(e)))
        .toList();
  }
}

class MyPageWishlistAllResponseModel {
  late int idx;
  late int userIdx;
  late String title;
  late String content;
  late String address;
  late String startDate;
  late String endDate;
  late int point;
  late bool wishlistCheck;
  late List<MyPageWishlistAllPhotosResponseModel> photos =
      <MyPageWishlistAllPhotosResponseModel>[];
  late DateTime createdAt;

  MyPageWishlistAllResponseModel({
    required this.idx,
    required this.userIdx,
    required this.title,
    required this.content,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.point,
    required this.wishlistCheck,
    required this.createdAt,
  });

  MyPageWishlistAllResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    userIdx = data['user_idx'];
    title = data['title'] ?? "제목";
    content = data['content'] ?? "내용";
    address = data['address'] ?? "주소";
    startDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['started_at'] ?? now));
    endDate =
        DateFormat("MM월 dd일").format(DateTime.parse(data['ended_at'] ?? now));
    point = data['point'] ?? 0;
    wishlistCheck = data['wishlist_check'] ?? false;
    // user = HouseAllUserResponseModel.fromJson(data["user"]);
    data["photos"]
        .map(
            (e) => photos.add(MyPageWishlistAllPhotosResponseModel.fromJson(e)))
        .toList();
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MyPageWishlistAllPhotosResponseModel {
  late int idx;
  late int houseIdx;
  late String url;
  late DateTime createdAt;

  MyPageWishlistAllPhotosResponseModel({
    required this.idx,
    required this.houseIdx,
    required this.url,
    required this.createdAt,
  });

  MyPageWishlistAllPhotosResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    houseIdx = data['houses_idx'];
    url = data['url'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}
