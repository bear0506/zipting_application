DateTime now = DateTime.now();

class HouseTradeBaseResponseModel {
  late String? status;
  late String? error;
  late dynamic message;

  HouseTradeBaseResponseModel.fromJson(Map<String, dynamic> data) {
    status = data["status"];
    error = data["error"];
    message = data["message"];
  }
}

class HouseMutualTradeUpdateRequestModel {
  int? targetIdx;

  HouseMutualTradeUpdateRequestModel({
    required int targetIdx,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "target_idx": targetIdx,
    };

    return map;
  }
}
