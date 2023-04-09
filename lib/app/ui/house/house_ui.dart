import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';

import 'package:zipting/app/controller/house/house_controller.dart';
import 'package:zipting/app/controller/review/review_all_controller.dart';
import 'package:zipting/app/controller/user/user_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_dialog_widget.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';

class HouseUi extends GetView<HouseController> {
  const HouseUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              controller.isShimmerVisible.value == true
                  ? _appbarShimmerWidget()
                  : _appbarWidget(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: controller.isShimmerVisible.value == true
                          ? Column(
                              children: [
                                _contentProfileShimmerWidget(),
                                const SizedBox(height: 10),
                                _contentDetailShimmerWidget(),
                                _contentMapShimmerWidget(),
                                _contentHashTagShimmerWidget(),
                                _contentReivewShimmerWidget(),
                              ],
                            )
                          : Column(
                              children: [
                                _contentProfileWidget(),
                                const SizedBox(height: 10),
                                _contentDetailWidget(),
                                _contentMapWidget(),
                                const SizedBox(height: 30),
                                _contentHashTagWidget(),
                                _contentReivewWidget(),
                              ],
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: controller.isShimmerVisible.value == true
              ? _bottomNavigationBarShimmerWidget()
              : _bottomNavigationBarWidget(),
        ),
      );

  // 앱바 위젯
  Widget _appbarWidget() => SliverAppBar(
        expandedHeight: 300,
        pinned: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
          tooltip: "뒤로가기",
          onPressed: () {
            Get.delete<HouseController>();
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: LikeButton(
              isLiked: controller.house.first.wishlistCheck,
              likeBuilder: (_) => Icon(
                controller.house.first.wishlistCheck == true
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: controller.house.first.wishlistCheck == true
                    ? kPrimaryColor
                    : Colors.white70,
                size: 32,
              ),
              onTap: (_) => controller.handleWishlistAction(
                houseIdx: controller.house.first.idx,
              ),
            ),
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: CarouselSlider(
            options: CarouselOptions(
              height: 360,
              viewportFraction: 1,
              autoPlay: controller.isImagesEnabeld.value,
            ),
            items: controller.housePhotos
                .map(
                  (value) => _imageListWidget(value),
                )
                .toList(),
          ),
        ),
      );

  // 앱바 쉬머 위젯
  Widget _appbarShimmerWidget() => SliverAppBar(
        expandedHeight: 300,
        pinned: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        leading: const Text(""),
        actions: const [
          Text(""),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: CarouselSlider(
            options: CarouselOptions(
              height: 360,
              viewportFraction: 1,
            ),
            items: controller.housePhotos
                .map(
                  (value) => _imageListShimmerWidget(),
                )
                .toList(),
          ),
        ),
      );

  // 이미지 위젯
  Widget _imageListWidget(value) => Image.network(
        value.url,
        width: Get.width,
        height: 360,
        fit: BoxFit.cover,
      );

  // 이미지 쉬머 위젯
  Widget _imageListShimmerWidget() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: Get.width,
          height: 360,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      );

  // 프로필 위젯
  Widget _contentProfileWidget() => Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(controller.houseUser.first.photo),
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
                  Get.toNamed("/user/${controller.houseUser.first.idx}",
                      preventDuplicates: false);
                },
              ),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      child: Text(
                        controller.houseUser.first.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.delete<UserController>();
                        Get.toNamed("/user/${controller.houseUser.first.idx}",
                            preventDuplicates: false);
                      }),
                  const SizedBox(height: 6),
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
                        itemBuilder: (context, _) => const Icon(
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
                  const SizedBox(height: 6),
                ],
              ),
            ],
          ),
          globalDividerWidget(bottom: 10),
        ],
      );

  // 프로필 쉬머 위젯
  Widget _contentProfileShimmerWidget() => Column(
        children: [
          Row(
            children: [
              Shimmer.fromColors(
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
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 6),
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
            ],
          ),
          globalDividerWidget(top: 26, bottom: 10),
        ],
      );

  // 내용 위젯
  Widget _contentDetailWidget() => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.house.first.title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 19,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.house.first.address,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.attach_money_rounded,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                "${controller.handleNumberFormat(controller.house.first.point)}P (1박)",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                "${controller.house.first.start} ~ ${controller.house.first.end}",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [

          //   ],
          // ),
          const SizedBox(height: 30),
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Column(
              //       children: const [
              //         Icon(
              //           Icons.verified_outlined,
              //           size: 36,
              //           color: Colors.grey,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '본인인증',
              //           style: TextStyle(
              //             color: Colors.black54,
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         )
              //       ],
              //     ),
              //     Column(
              //       children: const [
              //         Icon(
              //           Icons.sentiment_very_satisfied_outlined,
              //           size: 36,
              //           color: Colors.grey,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '내집인증',
              //           style: TextStyle(
              //             color: Colors.black54,
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         )
              //       ],
              //     ),
              //     Column(
              //       children: const [
              //         Icon(
              //           Icons.verified_user_outlined,
              //           size: 36,
              //           color: Colors.grey,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '접종인증',
              //           style: TextStyle(
              //             color: Colors.black54,
              //             fontSize: 14,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         )
              //       ],
              //     )
              //   ],
              // ),
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.apartment_rounded,
                        size: 36,
                        color: controller.house.first.houseType == "아파트"
                            ? kPrimaryColor
                            : Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "아파트　",
                        style: TextStyle(
                          color: controller.house.first.houseType == "아파트"
                              ? kPrimaryColor
                              : Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.document_scanner_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '전세인증',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.photo_size_select_small_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${controller.house.first.acreage}평",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.door_back_door_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "방 ${controller.house.first.roomCount}개",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.bathtub_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "욕실 ${controller.house.first.bathRoomCount}개",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.bed_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "침대 ${controller.house.first.bedCount}개",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.house.first.content,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );

  // 내용 쉬머 위젯
  Widget _contentDetailShimmerWidget() => Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 20,
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
              width: Get.width,
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
              width: Get.width,
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          const SizedBox(height: 20),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: Get.width,
            height: 1,
            color: Colors.grey.shade200,
          ),
          const SizedBox(height: 30),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );

  // 지도 위젯
  Widget _contentMapWidget() => Container(
        height: 200,
        alignment: Alignment.centerLeft,
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(37.50405757806334, 126.78740316684865),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              // attributionBuilder: (_) {},
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 100,
                  height: 100,
                  point: LatLng(37.50405757806334, 126.78740316684865),
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  // 지도 위젯
  Widget _contentMapShimmerWidget() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: Get.width,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
      );

  // 해시태그 위젯
  Widget _contentHashTagWidget() => Column(
        children: [
          SizedBox(
            width: Get.width,
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.houseTags.length,
              itemBuilder: (_, index) => Row(
                children: [
                  const Icon(
                    Icons.tag,
                    size: 18,
                    color: Colors.grey,
                  ),
                  Text(
                    controller.houseTags[index].tag,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          globalDividerWidget(bottom: 10),
        ],
      );

  // 해시태그 쉬머 위젯
  Widget _contentHashTagShimmerWidget() => Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: Get.width,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          globalDividerWidget(bottom: 10),
        ],
      );

  // 리뷰 위젯
  Widget _contentReivewWidget() => Column(
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
                  Get.toNamed("/house/review/all/${controller.houseIdx.value}",
                      preventDuplicates: false);
                },
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.reviews.length,
            itemBuilder: (BuildContext _, int index) => Column(
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
  Widget _contentReivewShimmerWidget() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: Get.width - 40,
                  height: 20,
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

  //상호교환
  // Future<void> showExchangeDialog(BuildContext context) async {
  //   List<bool> _isSelected = [true, false, false];
  //   return await showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //             titlePadding: EdgeInsets.zero,
  //             title: Container(
  //               padding: const EdgeInsets.all(8),
  //               decoration: const BoxDecoration(
  //                   border: Border(
  //                       bottom: BorderSide(color: kPrimaryColor, width: 1))),
  //               child: Container(
  //                 padding: const EdgeInsets.all(8),
  //                 child: const Text(
  //                   '집 선택 하기',
  //                   style: TextStyle(color: kTextBodyColor, fontSize: 20),
  //                 ),
  //               ),
  //             ),
  //             contentPadding: EdgeInsets.zero,
  //             content: Column(mainAxisSize: MainAxisSize.min, children: [
  //               SizedBox(
  //                 width: 500,
  //                 child: RotatedBox(
  //                   quarterTurns: 1,
  //                   child: ToggleButtons(
  //                     isSelected: _isSelected,
  //                     fillColor: kPrimaryColor,
  //                     color: kBlackColor,
  //                     selectedColor: kSecondaryColor,
  //                     borderColor: Colors.white,
  //                     children: [
  //                       RotatedBox(
  //                         quarterTurns: 3,
  //                         child: Container(
  //                           padding: const EdgeInsets.all(12),
  //                           decoration: const BoxDecoration(
  //                               border: Border(
  //                                   bottom: BorderSide(
  //                             width: 1,
  //                             color: kGrey02Color,
  //                           ))),
  //                           child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceAround,
  //                               children: [
  //                                 SizedBox(
  //                                     width: 72,
  //                                     child: Image.asset(
  //                                         'assets/images/signin.png')),
  //                                 Column(
  //                                   mainAxisAlignment: MainAxisAlignment.end,
  //                                   crossAxisAlignment: CrossAxisAlignment.end,
  //                                   children: const [
  //                                     Text(
  //                                       '태영 아파트 2단지',
  //                                       style: TextStyle(
  //                                           fontSize: 15, color: kBlackColor),
  //                                     ),
  //                                     Text(
  //                                       '동호로 25가길 31, 서울특별시',
  //                                       style: TextStyle(
  //                                           fontSize: 12, color: kBlackColor),
  //                                     ),
  //                                     Text(
  //                                       '270포인트 / 박',
  //                                       style: TextStyle(fontSize: 12),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ]),
  //                         ),
  //                       ),
  //                       RotatedBox(
  //                         quarterTurns: 3,
  //                         child: Container(
  //                           padding: const EdgeInsets.all(12),
  //                           decoration: const BoxDecoration(
  //                               border: Border(
  //                                   bottom: BorderSide(
  //                             width: 1,
  //                             color: kGrey02Color,
  //                           ))),
  //                           child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceAround,
  //                               children: [
  //                                 SizedBox(
  //                                     width: 72,
  //                                     child: Image.asset(
  //                                         'assets/images/signin.png')),
  //                                 Column(
  //                                   mainAxisAlignment: MainAxisAlignment.end,
  //                                   crossAxisAlignment: CrossAxisAlignment.end,
  //                                   children: const [
  //                                     Text(
  //                                       '태영 아파트 2단지',
  //                                       style: TextStyle(
  //                                           fontSize: 15, color: kBlackColor),
  //                                     ),
  //                                     Text(
  //                                       '동호로 25가길 31, 서울특별시',
  //                                       style: TextStyle(
  //                                           fontSize: 12, color: kBlackColor),
  //                                     ),
  //                                     Text(
  //                                       '270포인트 / 박',
  //                                       style: TextStyle(fontSize: 12),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ]),
  //                         ),
  //                       ),
  //                       RotatedBox(
  //                         quarterTurns: 3,
  //                         child: Container(
  //                           padding: const EdgeInsets.all(12),
  //                           decoration: const BoxDecoration(
  //                               border: Border(
  //                                   bottom: BorderSide(
  //                             width: 1,
  //                             color: kGrey02Color,
  //                           ))),
  //                           child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceAround,
  //                               children: [
  //                                 SizedBox(
  //                                     width: 72,
  //                                     child: Image.asset(
  //                                         'assets/images/signin.png')),
  //                                 Column(
  //                                   mainAxisAlignment: MainAxisAlignment.end,
  //                                   crossAxisAlignment: CrossAxisAlignment.end,
  //                                   children: const [
  //                                     Text(
  //                                       '태영 아파트 2단지',
  //                                       style: TextStyle(
  //                                           fontSize: 15, color: kBlackColor),
  //                                     ),
  //                                     Text(
  //                                       '동호로 25가길 31, 서울특별시',
  //                                       style: TextStyle(
  //                                           fontSize: 12, color: kBlackColor),
  //                                     ),
  //                                     Text(
  //                                       '270포인트 / 박',
  //                                       style: TextStyle(fontSize: 12),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ]),
  //                         ),
  //                       ),
  //                     ],
  //                     onPressed: (int index) {
  //                       // setState(() {
  //                       //   _isSelected[index] = !_isSelected[index];
  //                       // });
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ]),
  //             actions: [
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //                 child: Column(
  //                   children: [
  //                     SizedBox(
  //                       width: 300,
  //                       height: 35,
  //                       child: ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                             shape: const StadiumBorder()),
  //                         child: const Text(
  //                           '확인',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 15.0,
  //                           ),
  //                           textAlign: TextAlign.center,
  //                         ),
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                           showExchangeResultDialog(context);
  //                         },
  //                       ),
  //                     ),
  //                     const SizedBox(height: 10)
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ));
  // }

  // void showExchangeResultDialog(BuildContext context) => showDialog(
  // context: context,
  // builder: (BuildContext context) => AlertDialog(
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: const [
  //                     Text(
  //                       'SolarDragon',
  //                       style: TextStyle(
  //                           fontSize: 20,
  //                           color: kPrimaryColor,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                     Text(
  //                       '님에게',
  //                       style: TextStyle(
  //                           fontSize: 20,
  //                           color: kBlackColor,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //                 const Text(
  //                   '교환 요청 메세지가 전송되었습니다.',
  //                   style: TextStyle(
  //                       fontSize: 15,
  //                       color: kBlackColor,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               width: 40,
  //               child:
  //                   Image.asset('assets/icons/room_detail/paperplane.png'),
  //             ),
  //             const SizedBox(
  //               height: 16,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: const [
  //                 Text(
  //                   '메세지 함',
  //                   style: TextStyle(
  //                     fontSize: 10,
  //                     color: kPrimaryColor,
  //                   ),
  //                 ),
  //                 Text(
  //                   '을 확인해주세요',
  //                   style: TextStyle(
  //                     fontSize: 10,
  //                     color: kBlackColor,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
  //         actionsPadding: EdgeInsets.zero,
  //         buttonPadding: EdgeInsets.zero,
  //         actions: [
  //           Container(
  //               decoration: const BoxDecoration(
  //                   color: kPrimaryColor,
  //                   borderRadius: BorderRadius.only(
  //                       centerLeft: Radius.circular(3),
  //                       bottomRight: Radius.circular(3))),
  //               child: Row(children: [
  //                 Container(
  //                   decoration: const BoxDecoration(
  //                       color: kPrimaryColor,
  //                       borderRadius: BorderRadius.only(
  //                         centerLeft: Radius.circular(10),
  //                       )),
  //                   child: TextButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: Align(
  //                           alignment: Alignment.center,
  //                           child: Row(children: const [
  //                             SizedBox(width: 50),
  //                             Text(
  //                               "확인",
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                             SizedBox(width: 20),
  //                           ]))),
  //                 ),
  //                 Container(
  //                   decoration: const BoxDecoration(
  //                       color: kPrimaryColor,
  //                       borderRadius: BorderRadius.only(
  //                           bottomRight: Radius.circular(15))),
  //                   child: TextButton(
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: Align(
  //                           alignment: Alignment.center,
  //                           child: Row(children: const [
  //                             SizedBox(width: 70),
  //                             Text(
  //                               "메세지 함으로",
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                             SizedBox(width: 18)
  //                           ]))),
  //                 )
  //               ]))
  //         ]));

  Widget _bottomNavigationBarWidget() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            child: const Text(
              '교환 요청',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => globalTradeDialogWidget(
              idx: "${controller.houseIdx.value}",
              content: "교환 요청하시겠습니까?",
            ),
          ),
        ),
      );

  Widget _bottomNavigationBarShimmerWidget() => const SizedBox();
}
