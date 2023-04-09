import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';
import 'package:zipting/app/data/model/mypage/mypage_wishlist_all_model.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/app/data/provider/mypage/mypage_wishlist_all_provider.dart';
import 'package:zipting/app/data/provider/wishlist/wishlist_provider.dart';
import 'package:zipting/main.dart';

class MyPageWishListAllController extends GetxController {
  late RxList<MyPageWishlistAllResponseModel> houses =
      <MyPageWishlistAllResponseModel>[].obs;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await MyPageWishlistAllProvider().dio().then((value) {
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

  Rx<WishlistRequestModel> wishlistRequestModel = WishlistRequestModel(
    houseIdx: 0,
  ).obs;
  Future<bool> handleWishlistAction({
    required int houseIdx,
  }) async {
    wishlistRequestModel.update((_) {
      _?.houseIdx = houseIdx;
    });

    int index = houses.indexWhere((value) => value.idx == houseIdx);

    if (isLikedEnabled.value == false) {
      // houses[houses.indexWhere((value) => value.idx == houseIdx)] = food;
      houses[index].wishlistCheck = !houses[index].wishlistCheck;
      isLikedEnabled.value = true;

      await handleWishlistProvider();
    }

    return houses[index].wishlistCheck;
  }

  Future<void> handleWishlistProvider() async {
    try {
      await WishlistProvider()
          .dio(requestModel: wishlistRequestModel)
          .then((value) {
        if (value.status == "success") {
        } else {
          logger.d(value.message);
        }

        isLikedEnabled.value = false;
        handleInitProvider();
        Get.put(MyPageController()).handleInitProvider();
      });
    } catch (e) {
      logger.d(e);
      isLikedEnabled.value = false;
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
