import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/data/model/house/house_all_model.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/app/data/provider/house/house_all_provider.dart';
import 'package:zipting/app/data/provider/wishlist/wishlist_provider.dart';
import 'package:zipting/main.dart';

class HouseAllController extends GetxController {
  late RxList<HouseAllResponseModel> houses = <HouseAllResponseModel>[].obs;
  // RxList<HouseAllUserResponseModel> reviewUser = <HouseAllUserResponseModel>[].obs;
  // RxList<HouseAllPhotosResponseModel> reviewPhotos =
  //     <HouseAllPhotosResponseModel>[].obs;

  Rx<dynamic> userIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await HouseAllProvider().dio(userIdx: userIdx.value).then((value) {
        if (value.status == "success") {
          houses.assignAll(value.houses);
          // reviewUser.assign(value.reviews.user);
          // reviewPhotos.assignAll(value.reviews.photos);
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
