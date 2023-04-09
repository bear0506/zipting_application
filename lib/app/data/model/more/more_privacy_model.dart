DateTime now = DateTime.now();

class MorePrivacyBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  MorePrivacyBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class MorePrivacyUpdateBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;
  late Object user = MorePrivacyUpdateUserResponseModel;

  MorePrivacyUpdateBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
    user = MorePrivacyUpdateUserResponseModel.fromJson(data["message"]["user"]);
  }
}

class MorePrivacyUpdateUserResponseModel {
  late int idx;
  late String email;
  late String name;
  late String nickname;
  late String phone;
  late String introduce;
  late int points;
  late String photo;
  late bool userCertified;
  late bool houseCertified;
  late bool vaccineCertified;
  late DateTime createdAt;

  MorePrivacyUpdateUserResponseModel({
    required this.idx,
    required this.email,
    required this.name,
    required this.nickname,
    required this.phone,
    required this.introduce,
    required this.points,
    required this.photo,
    required this.userCertified,
    required this.houseCertified,
    required this.vaccineCertified,
    required this.createdAt,
  });

  MorePrivacyUpdateUserResponseModel.fromJson(Map<String, dynamic> data) {
    idx = data['idx'];
    email = data['email'];
    name = data['name'];
    nickname = data['nickname'];
    introduce = data['introduce'];
    phone = data['phone'];
    points = data['points'];
    photo = data['photo'];
    userCertified = data['user_certified'];
    houseCertified = data['house_certified'];
    vaccineCertified = data['vaccine_certified'];
    createdAt =
        (data['created_at'] != null ? DateTime.parse(data['created_at']) : now);
  }
}

class MorePrivacyUpdateRequestModel {
  String? email;
  String? name;
  String? phone;

  MorePrivacyUpdateRequestModel({
    required String email,
    required String name,
    required String phone,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "name": name,
      "phone": phone,
    };

    return map;
  }
}
