import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/home/home_controller.dart';
import 'package:zipting/app/core/values/colors.dart';

class HomeUi extends GetView<HomeController> {
  const HomeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CarouselSliderWidget(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: const [
                      RecommendHouseWidget(),
                      AdvertiseHouseWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class CarouselSliderWidget extends GetView<HomeController> {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => CarouselSlider(
          options: CarouselOptions(
            height: 250,
            viewportFraction: 1,
            autoPlay: controller.isShimmerVisible.value == true ? false : true,
          ),
          items: controller.banners
              .map(
                (value) => controller.isShimmerVisible.value == true
                    ? const CarouselShimmerWidget()
                    : CarouselContentWidget(value: value),
              )
              .toList(),
        ),
      );
}

class CarouselContentWidget extends StatelessWidget {
  const CarouselContentWidget({Key? key, required this.value})
      : super(key: key);

  final dynamic value;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Image.network(value.url, fit: BoxFit.cover),
      );
}

class CarouselShimmerWidget extends StatelessWidget {
  const CarouselShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      );
}

class RecommendHouseWidget extends GetView<HomeController> {
  const RecommendHouseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.house,
                  color: kPrimaryColor,
                  size: 32,
                ),
                SizedBox(width: 10),
                Text(
                  "당신만을 위한 색다른 집",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                viewportFraction: 0.85,
                enableInfiniteScroll: false,
              ),
              items: controller.houses
                  .map(
                    (value) => controller.isShimmerVisible.value == true
                        ? const HouseShimmerWidget()
                        : HouseContentWidget(type: "recommend", value: value),
                  )
                  .toList(),
            ),
          ],
        ),
      );
}

class AdvertiseHouseWidget extends GetView<HomeController> {
  const AdvertiseHouseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.recommend,
                  color: kPrimaryColor,
                  size: 32,
                ),
                SizedBox(width: 10),
                Text(
                  "이런 집은 어때요?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                viewportFraction: 0.85,
                enableInfiniteScroll: false,
              ),
              items: controller.advertisedHouses
                  .map((value) => controller.isShimmerVisible.value == true
                      ? const HouseShimmerWidget()
                      : HouseContentWidget(type: "advertise", value: value))
                  .toList(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
}

class HouseContentWidget extends GetView<HomeController> {
  const HouseContentWidget({Key? key, required this.type, required this.value})
      : super(key: key);

  final String type;
  final dynamic value;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Get.toNamed("/house/${value.idx}"),
        child: Padding(
          padding: const EdgeInsets.only(right: 30, bottom: 30),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(2, 2),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(value.photos[0].url,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LikeButton(
                                padding: const EdgeInsets.all(15),
                                isLiked: value.wishlistCheck,
                                likeBuilder: (bool isLiked) => Icon(
                                  value.wishlistCheck
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: value.wishlistCheck
                                      ? kPrimaryColor
                                      : Colors.white70,
                                  size: 32,
                                ),
                                onTap: (bool isLiked) => type == "recommend"
                                    ? controller.handleRecommendWishlistAction(
                                        houseIdx: value.idx,
                                      )
                                    : controller.handleAdvertiseWishlistAction(
                                        houseIdx: value.idx,
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.title,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        value.address,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '응답률 100%',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${value.point} / 1박",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "${value.start} ~ ${value.end}",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class HouseShimmerWidget extends StatelessWidget {
  const HouseShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.only(right: 30, bottom: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          ),
        ),
      );
}
