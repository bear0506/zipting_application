class FindBaseResponseModel {
  final String? status;
  final String? error;
  final dynamic message;

  FindBaseResponseModel({
    this.status,
    this.error,
    this.message,
  });

  factory FindBaseResponseModel.fromJson(Map<String, dynamic> json) =>
      FindBaseResponseModel(
        status: json["status"] ?? "",
        error: json["error"] ?? "",
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
      };
}

class FindEmailRequestModel {
  String name = '';
  String phone = '';

  FindEmailRequestModel({
    name = '',
    phone = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"name": name, "phone": phone};

    return map;
  }
}

class FindEmailVerifyRequestModel {
  String name = '';
  String phone = '';
  String number = '';

  FindEmailVerifyRequestModel({
    name = '',
    phone = '',
    number = "",
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"name": name, "phone": phone, "number": number};

    return map;
  }
}

class FindPasswordRequestModel {
  String email = '';
  String phone = '';

  FindPasswordRequestModel({
    email = '',
    phone = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"email": email, "phone": phone};

    return map;
  }
}

class FindPasswordVerifyRequestModel {
  String email = '';
  String phone = '';
  String number = '';

  FindPasswordVerifyRequestModel({
    email = '',
    phone = '',
    number = "",
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email,
      "phone": phone,
      "number": number
    };

    return map;
  }
}
