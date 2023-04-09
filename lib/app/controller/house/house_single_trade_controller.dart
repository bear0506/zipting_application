import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/data/model/house/house_trade_model.dart';
import 'package:zipting/app/data/model/management/management_house_model.dart';
import 'package:zipting/app/data/provider/house/house_trade_provider.dart';
import 'package:zipting/app/data/provider/management/management_house_provider.dart';
import 'package:zipting/main.dart';

class HouseSingleTradeController extends GetxController {
  late RxList<ManagementHouseReadResponseModel> houses =
      <ManagementHouseReadResponseModel>[].obs;

  final Rx<TextEditingController> startedAtController =
      TextEditingController().obs;
  final Rx<TextEditingController> endedAtController =
      TextEditingController().obs;
  late Rx<FocusNode> startedAtFocusNode = FocusNode().obs;
  late Rx<FocusNode> endedAtFocusNode = FocusNode().obs;

  Rx<dynamic> targetHouseIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 리퀘스트 오류 메세지
  RxString reqeustMessage = "".obs;
  // 업데이트 성공 여부
  RxBool isUpdateProvider = false.obs;
  // 시작
  Rx<DateTime> startedAt = DateTime.now().obs;
  // 종료
  Rx<DateTime> endedAt = DateTime.now().obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  // 날짜 선택
  Future<dynamic> handleDatePikcer(
      {required dynamic context, required String type}) {
    Future<DateTime?> future = showDatePicker(
      context: context,
      initialDate: type == "시작"
          ? DateTime.now()
          : DateTime(
              startedAt.value.year, startedAt.value.month, startedAt.value.day),
      firstDate: type == "시작"
          ? DateTime.now()
          : DateTime(
              startedAt.value.year, startedAt.value.month, startedAt.value.day),
      lastDate: DateTime(2099),
      builder: (BuildContext context, Widget? child) => child!,
    );

    return future.then((date) {
      if (type == "시작") {
        startedAtController.value.text =
            DateFormat("yyyy.MM.dd").format(DateTime.parse(date.toString()));
        startedAt.value = DateTime.parse(date.toString());
      } else if (type == "종료") {
        endedAtController.value.text =
            DateFormat("yyyy.MM.dd").format(DateTime.parse(date.toString()));
        endedAt.value = DateTime.parse(date.toString());
      }
    });
  }

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await ManagementHouseSingleReadProvider()
          .dio(houseIdx: targetHouseIdx)
          .then((value) {
        if (value.status == "success") {
          houses.assignAll(value.houses);
          houses.refresh();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(const Duration(milliseconds: 500),
          () => isShimmerVisible.value = false);
    }
  }

  // 리퀘스트 모델(데이터 넘기기)
  Rx<HouseMutualTradeUpdateRequestModel> requestModel =
      HouseMutualTradeUpdateRequestModel(
    targetIdx: 0,
  ).obs;

  void handleRequestModel({
    required int targetIdx,
  }) {
    requestModel.update((_) {
      _?.targetIdx = targetIdx;
    });
  }

  // 교환요청
  Future<void> handleUpdateProvider({required int houseIdx}) async {
    try {
      handleRequestModel(
        targetIdx: int.parse(targetHouseIdx.value),
      );

      logger.d(requestModel.toJson());

      await HouseTradeUpdateProvider()
          .dio(houseIdx: houseIdx, requestModel: requestModel)
          .then((value) {
        if (value.status == "success") {
          isUpdateProvider(true);
        } else {
          logger.d(value.message);
          reqeustMessage.value = value.message;
          isUpdateProvider(false);
        }
      });
    } catch (e) {
      logger.d(e);
      isUpdateProvider(false);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    handleInitProvider();

    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  // ignore: unnecessary_overrides
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
