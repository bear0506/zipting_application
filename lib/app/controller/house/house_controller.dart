import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/home/home_controller.dart';
import 'package:zipting/app/data/model/house/house_model.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/app/data/provider/house/house_provider.dart';
import 'package:zipting/app/data/provider/wishlist/wishlist_provider.dart';
import 'package:zipting/main.dart';

class HouseController extends GetxController {
  late RxList<HouseResponseModel> house = <HouseResponseModel>[].obs;
  late RxList<HouseUserResponseModel> houseUser =
      <HouseUserResponseModel>[].obs;
  late RxList<HousePhotosResponseModel> housePhotos =
      <HousePhotosResponseModel>[].obs;
  late RxList<HouseTagsResponseModel> houseTags =
      <HouseTagsResponseModel>[].obs;

  late RxList<ReviewResponseModel> reviews = <ReviewResponseModel>[].obs;
  // RxList<ReviewUserResponseModel> reviewUser = <ReviewUserResponseModel>[].obs;
  // RxList<ReviewPhotosResponseModel> reviewPhotos =
  //     <ReviewPhotosResponseModel>[].obs;

  Rx<dynamic> houseIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;
  // 상단 이미지 개수 체크
  RxBool isImagesEnabeld = false.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await HouseInitProvider().dio(houseIdx: houseIdx.value).then((value) {
        if (value.status == "success") {
          house.assign(value.houses);
          houseUser.assign(value.houses.user);
          housePhotos.assignAll(value.houses.photos);
          houseTags.assignAll(value.houses.tags);
          reviews.assignAll(value.reviews);
          // reviewUser.assign(value.reviews.user);
          // reviewPhotos.assignAll(value.reviews.photos);

          // 이미지 개수 체크
          isImagesEnabeld.value = housePhotos.length > 1 ? true : false;

          house.refresh();
          houseUser.refresh();
          housePhotos.refresh();
          houseTags.refresh();
          reviews.refresh();
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

    if (isLikedEnabled.value == false) {
      house.first.wishlistCheck = !house.first.wishlistCheck;
      isLikedEnabled.value = true;

      await handleWishlistProvider();
    }

    return house.first.wishlistCheck;
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
        Get.put(HomeController()).handleInitProvider();
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
