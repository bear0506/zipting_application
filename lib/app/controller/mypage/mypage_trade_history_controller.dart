import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/home/home_controller.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';
import 'package:zipting/app/data/model/mypage/mypage_trade_all_model.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/app/data/provider/mypage/mypage_trade_history_provider.dart';
import 'package:zipting/app/data/provider/wishlist/wishlist_provider.dart';
import 'package:zipting/main.dart';

class MyPageTradeHistoryController extends GetxController {
  late RxList<MyPageTradeAllResponseModel> houses =
      <MyPageTradeAllResponseModel>[].obs;

  Rx<dynamic> houseIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await MyPageTradeHistoryProvider().dio().then((value) {
        if (value.status == "success") {
          houses.assignAll(value.trades);
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

  // 찜 하기 버튼
  Future<bool> handleWishlistAction({
    required int houseIdx,
  }) async {
    Rx<WishlistRequestModel> requestModel = WishlistRequestModel(
      houseIdx: 0,
    ).obs;

    requestModel.update((_) {
      _?.houseIdx = houseIdx;
    });

    int index = houses.indexWhere((value) => value.idx == houseIdx);

    if (isLikedEnabled.value == false) {
      // houses[houses.indexWhere((value) => value.idx == houseIdx)] = food;
      houses[index].wishlistCheck = !houses[index].wishlistCheck;
      isLikedEnabled.value = true;

      await handleWishlistProvider(requestModel: requestModel);
    }

    return houses[index].wishlistCheck;
  }

  // 찜 하기
  Future<void> handleWishlistProvider({dynamic requestModel}) async {
    try {
      await WishlistProvider().dio(requestModel: requestModel).then((value) {
        if (value.status == "success") {
          handleInitProvider();
          Get.find<HomeController>().handleInitProvider();
          Get.find<MyPageController>().handleInitProvider();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    } finally {
      isLikedEnabled.value = false;
    }
  }

  // 교환 취소
  Future<void> handleTradeDeleteProvider({
    required dynamic type,
    required int tradeIdx,
    required int houseIdx,
  }) async {
    try {
      Rx<MyPageTradeRequestModel> requestModel = MyPageTradeRequestModel(
        type: "",
        tradeIdx: 0,
        houseIdx: 0,
      ).obs;

      requestModel.update((_) {
        _?.type = type;
        _?.tradeIdx = tradeIdx;
        _?.houseIdx = houseIdx;
      });

      await MyPageTradeDeleteProvider()
          .dio(requestModel: requestModel)
          .then((value) {
        if (value.status == "success") {
          handleInitProvider();
          Get.find<MyPageController>().handleInitProvider();
        } else {
          logger.d(value.message);
        }
      });
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    await handleInitProvider();

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
