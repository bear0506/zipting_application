import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/house/house_all_controller.dart';
import 'package:zipting/app/controller/house/house_controller.dart';
import 'package:zipting/app/controller/review/review_all_controller.dart';

import 'package:zipting/app/controller/user/user_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';

class UserUi extends StatelessWidget {
  UserUi({Key? key}) : super(key: key);

  final controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppbarWidget(appBar: AppBar()),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: controller.isShimmerVisible.value == true
                    ? Column(
                        children: [
                          _contentProfileShimmerWidget(),
                          _moreCarouselSliderHouseShimmerWidget(),
                          _reivewShimmerWidget(),
                        ],
                      )
                    : Column(
                        children: [
                          _contentProfileWidget(context),
                          _moreCarouselSliderHouseWidget(),
                          _reivewWidget(),
                        ],
                      ),
              ),
            ),
          ),
        ),
      );

  // 프로필 위젯
  Widget _contentProfileWidget(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 115,
                height: 115,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(controller.user.first.photo),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
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
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.first.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        unratedColor: kGrey02Color,
                        itemBuilder: (_, int index) => const Icon(
                          Icons.star,
                          color: kPrimaryColor,
                        ),
                        onRatingUpdate: (rating) {
                          // print(rating);
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '(10)',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '응답률 100%',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 0,
                    children: List.generate(
                      controller.certifyList.length,
                      (_) => Row(
                        children: [
                          Icon(
                            controller.certifyList[_]["icon"],
                            size: 24,
                            color:
                                controller.certifyList[_]["isCertify"] == true
                                    ? kPrimaryColor
                                    : Colors.grey,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.certifyList[_]["title"],
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(controller.user.first.introduce),
          globalDividerWidget(bottom: 10),
        ],
      );

  // 프로필 쉬머 위젯
  Widget _contentProfileShimmerWidget() => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                ),
              ),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: Get.width - 180,
                      height: 28,
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
                      width: Get.width - 180,
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
                      width: Get.width - 180,
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
                      width: Get.width - 180,
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
            ],
          ),
          const SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          globalDividerWidget(),
        ],
      );

  // 다른 집 위젯
  Widget _moreCarouselSliderHouseWidget() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "다른 집",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text(
                  "모두보기",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Get.delete<HouseAllController>();
                  Get.toNamed("/house/all/${controller.userIdx.value}",
                      preventDuplicates: false);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              viewportFraction: 0.5,
            ),
            items: controller.houses
                .map(
                  (value) => _moreCarouselSliderHouseContentWidget(value),
                )
                .toList(),
          ),
          globalDividerWidget(bottom: 10),
        ],
      );

  // 다른 집 쉬머 위젯
  Widget _moreCarouselSliderHouseShimmerWidget() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: Get.width - 40,
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
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              viewportFraction: 0.5,
            ),
            items: controller.houses
                .map(
                  (value) => _moreCarouselSliderHouseContentShimmerWidget(),
                )
                .toList(),
          ),
          globalDividerWidget(),
        ],
      );

  // 다른 집 컨텐츠 위젯
  Widget _moreCarouselSliderHouseContentWidget(value) => InkWell(
        onTap: () {
          Get.delete<HouseController>();
          Get.toNamed("/house/${value.idx}", preventDuplicates: false);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child:
                        Image.network(value.photos[0].url, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  width: 50,
                  height: 50,
                  child: LikeButton(
                    isLiked: value.wishlistCheck,
                    likeBuilder: (_) => Icon(
                      value.wishlistCheck
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color:
                          value.wishlistCheck ? kPrimaryColor : Colors.white70,
                      size: 26,
                    ),
                    onTap: (_) => controller.handleWishlistAction(
                      houseIdx: value.idx,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value.title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value.address,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${value.point}P (1박)",
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );

  // 다른 집 컨텐츠 쉬머 위젯
  Widget _moreCarouselSliderHouseContentShimmerWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
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
              width: 150,
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
              width: 150,
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
              width: 150,
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
      );

  // 리뷰 위젯
  Widget _reivewWidget() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "후기",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text(
                  "모두보기",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Get.delete<ReviewAllController>();
                  Get.toNamed("/review/all/${controller.userIdx.value}",
                      preventDuplicates: false);
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
                        },
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
          ),
        ],
      );

  // 리뷰 쉬머 위젯
  Widget _reivewShimmerWidget() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: Get.width - 40,
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
          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.reviews.length,
            itemBuilder: (BuildContext context, int index) => Column(
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
          ),
        ],
      );
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45, size: 32),
          tooltip: "뒤로가기",
          onPressed: () {
            Get.delete<UserController>();
            Get.back();
          },
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}
