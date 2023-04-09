/*
*title*: 찜
*description*: 찜 리퀘스트 및 리스폰스 모델 입니다.
*/

class WishlistResponseModel {
  final String? status;
  final String? error;
  final dynamic message;

  WishlistResponseModel({
    this.status,
    this.error,
    this.message,
  });

  factory WishlistResponseModel.formJson(Map<String, dynamic> json) =>
      WishlistResponseModel(
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

class WishlistRequestModel {
  late int houseIdx;

  WishlistRequestModel({
    houseIdx,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {"house_idx": houseIdx};
    return map;
  }
}
