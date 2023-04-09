/*
*title*: 프로필 관리
*description*: 프로필 관리 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MoreProfileBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  MoreProfileBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class MoreProfileUpdateBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;
  late Object user = MoreProfileUserResponseModel;

  MoreProfileUpdateBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
    user = MoreProfileUserResponseModel.fromJson(data["message"]["user"]);
  }
}

class MoreProfileUserResponseModel {
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

  MoreProfileUserResponseModel({
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

  MoreProfileUserResponseModel.fromJson(Map<String, dynamic> data) {
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

class MoreProfileUpdateRequestModel {
  dynamic images;
  String? nickname;
  String? introduce;

  MoreProfileUpdateRequestModel({
    required dynamic images,
    required String nickname,
    required String introduce,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "images": images,
      "nickname": nickname,
      "introduce": introduce,
    };

    return map;
  }
}
