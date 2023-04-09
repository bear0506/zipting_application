import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:zipting/app/data/model/review/review_model.dart';
import 'package:zipting/app/data/provider/review/review_all_provider.dart';
import 'package:zipting/main.dart';

class ReviewAllController extends GetxController {
  late RxList<ReviewAllResponseModel> reviews = <ReviewAllResponseModel>[].obs;
  // RxList<ReviewAllUserResponseModel> reviewUser = <ReviewAllUserResponseModel>[].obs;
  // RxList<ReviewAllPhotosResponseModel> reviewPhotos =
  //     <ReviewAllPhotosResponseModel>[].obs;

  Rx<dynamic> type = Get.parameters["type"].obs;
  Rx<dynamic> idx = Get.parameters["param"].obs;
  // 스켈레톤(쉬머)
  RxBool isShimmerVisible = true.obs;

  String handleNumberFormat(int param) =>
      NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');

  Future<void> handleInitProvider() async {
    try {
      if (type.value == null) {
        await ReviewAllProvider().dio(userIdx: idx.value).then((value) {
          if (value.status == "success") {
            reviews.assignAll(value.reviews);
            // reviewUser.assign(value.reviews.user);
            // reviewPhotos.assignAll(value.reviews.photos);
          } else {
            logger.d(value.message);
          }
        });
      } else {
        await HouseReviewAllProvider().dio(houseIdx: idx.value).then((value) {
          if (value.status == "success") {
            reviews.assignAll(value.reviews);
            // reviewUser.assign(value.reviews.user);
            // reviewPhotos.assignAll(value.reviews.photos);
          } else {
            logger.d(value.message);
          }
        });
      }
    } catch (e) {
      logger.d(e);
    } finally {
      Future.delayed(const Duration(milliseconds: 500),
          () => isShimmerVisible.value = false);
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
