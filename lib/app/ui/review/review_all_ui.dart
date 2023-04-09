import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/review/review_all_controller.dart';
import 'package:zipting/app/controller/user/user_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';

class ReviewAllUi extends StatelessWidget {
  ReviewAllUi({Key? key}) : super(key: key);

  final ReviewAllController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          appBar: _appbarWidget(),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "후기",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: Get.height - 190,
                    child: controller.isShimmerVisible.value == true
                        ? _reviewShimmerWidget()
                        : _reviewWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  PreferredSizeWidget _appbarWidget() => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45, size: 32),
          tooltip: "뒤로가기",
          onPressed: () {
            Get.delete<ReviewAllController>();
            Get.back();
          },
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );

  // 리뷰 위젯
  Widget _reviewWidget() => ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.reviews.length,
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: InkWell(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                controller.reviews[index].user.photo),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: const Offset(2, 2),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.delete<UserController>();
                        Get.toNamed(
                            "/user/${controller.reviews[index].user.idx}",
                            preventDuplicates: false);
                      }),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.reviews[index].user.nickname,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 20,
                            unratedColor: kGrey02Color,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: kPrimaryColor,
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width - 110,
                        child: Text(
                          controller.reviews[index].content,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "${controller.reviews[index].startDate} ~ ${controller.reviews[index].endDate}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            globalDividerWidget(),
          ],
        ),
      );

  // 리뷰 쉬머 위젯
  Widget _reviewShimmerWidget() => ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (BuildContext _, int index) => Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              width: Get.width - 110,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: Get.width - 110,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: Get.width - 110,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            globalDividerWidget(),
          ],
        ),
      );
}
