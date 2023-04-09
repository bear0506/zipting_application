import 'package:get/get.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';
import 'package:zipting/app/data/model/home/home_model.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/app/data/provider/home/home_provider.dart';
import 'package:zipting/app/data/provider/wishlist/wishlist_provider.dart';
import 'package:zipting/main.dart';

class HomeController extends GetxController {
  late RxList<HomeBannersResponseModel> banners =
      <HomeBannersResponseModel>[].obs;
  late RxList<HomeHouseResponseModel> houses = <HomeHouseResponseModel>[].obs;
  late RxList<HomeAdvertisedResponseModel> advertisedHouses =
      <HomeAdvertisedResponseModel>[].obs;

  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;

  // 조회
  Future<void> handleInitProvider() async {
    try {
      await HomeInitProvider().dio().then((value) {
        if (value.status == "success") {
          banners.addAll(value.banners);
          houses.addAll(value.houses);
          advertisedHouses.addAll(value.advertisedHouses);

          banners.refresh();
          houses.refresh();
          advertisedHouses.refresh();
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

  // 위시리스트 모델
  Rx<WishlistRequestModel> wishlistRequestModel = WishlistRequestModel(
    houseIdx: 0,
  ).obs;

  // 당신만을 위한 색다른 집
  Future<bool> handleRecommendWishlistAction({
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

  // 이런 집은 어때요?
  Future<bool> handleAdvertiseWishlistAction({
    required int houseIdx,
  }) async {
    wishlistRequestModel.update((_) {
      _?.houseIdx = houseIdx;
    });

    int index = advertisedHouses.indexWhere((value) => value.idx == houseIdx);

    if (isLikedEnabled.value == false) {
      // houses[houses.indexWhere((value) => value.idx == houseIdx)] = food;
      advertisedHouses[index].wishlistCheck =
          !advertisedHouses[index].wishlistCheck;
      isLikedEnabled.value = true;

      await handleWishlistProvider();
    }

    return advertisedHouses[index].wishlistCheck;
  }

  // 위시리스트 업데이트
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
        Get.find<MyPageController>().handleInitProvider();
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
