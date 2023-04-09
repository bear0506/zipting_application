import 'package:intl/intl.dart';

/*
*title*: 비밀번호 관리
*description*: 비밀번호 관리 리퀘스트 및 리스폰스 모델 입니다.
*/

DateTime now = DateTime.now();

class MorePasswordUpdateBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  MorePasswordUpdateBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class MorePasswordUpdateRequestModel {
  String? password;

  MorePasswordUpdateRequestModel({
    required String password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "password": password,
    };

    return map;
  }
}
