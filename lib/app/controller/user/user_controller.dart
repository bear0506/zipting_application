import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zipting/app/controller/home/home_controller.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';
import 'package:zipting/app/data/model/user/user_model.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/app/data/provider/user/user_provider.dart';
import 'package:zipting/app/data/provider/wishlist/wishlist_provider.dart';
import 'package:zipting/main.dart';

class UserController extends GetxController {
  late RxList<UserResponseModel> user = <UserResponseModel>[].obs;
  late RxList<HouseResponseModel> houses = <HouseResponseModel>[].obs;
  late RxList<ReviewResponseModel> reviews = <ReviewResponseModel>[].obs;

  Rx<dynamic> userIdx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;
  // 좋아요 버튼 중복 클릭 방지
  RxBool isLikedEnabled = false.obs;
  // 인증 리스트
  late RxList certifyList = [
    {
      "title": "본인인증",
      "icon": Icons.verified_outlined,
      "isCertify": false,
    },
    {
      "title": "내집인증",
      "icon": Icons.sentiment_very_satisfied_outlined,
      "isCertify": false,
    },
    {
      "title": "예방접종",
      "icon": Icons.verified_user_outlined,
      "isCertify": false,
    }
  ].obs;
  // 위시리스트 리퀘스트 모델
  Rx<WishlistRequestModel> wishlistRequestModel = WishlistRequestModel(
    houseIdx: 0,
  ).obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      await UserProvider().dio(userIdx: userIdx).then((value) {
        if (value.status == "success") {
          user.assign(value.user);
          houses.assignAll(value.houses);
          reviews.assignAll(value.reviews);

          // 인증 정보 업데이트
          certifyList[0]["isCertify"] = user.first.userCertified;
          certifyList[1]["isCertify"] = user.first.houseCertified;
          certifyList[2]["isCertify"] = user.first.vaccineCertified;

          user.refresh();
          houses.refresh();
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
        Get.find<HomeController>().handleInitProvider();
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
