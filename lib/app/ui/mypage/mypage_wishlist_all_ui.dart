import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/house/house_controller.dart';
import 'package:zipting/app/controller/mypage/mypage_wishlist_all_controller.dart';

import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';

class MyPageWishListAllUi extends GetView<MyPageWishListAllController> {
  const MyPageWishListAllUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          appBar: AppbarWidget(appBar: AppBar()),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "찜 목록",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: controller.isShimmerVisible.value == true
                        ? const WishListShimmerWidget()
                        : const WishListWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
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
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class WishListWidget extends GetView<MyPageWishListAllController> {
  const WishListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.houses.isEmpty
            ? const WishListContentEmptyWidget()
            : const WishListContentWidget(),
      );
}

class WishListContentEmptyWidget extends StatelessWidget {
  const WishListContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        width: Get.width,
        height: Get.height / 2 + 106,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.mode_comment_outlined,
              color: Colors.grey.shade300,
              size: 56,
            ),
            const SizedBox(height: 30),
            Text(
              "내역이 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 26,
              ),
            )
          ],
        ),
      );
}

class WishListContentWidget extends GetView<MyPageWishListAllController> {
  const WishListContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.houses.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 115,
                              height: 115,
                              child: Image.network(
                                  controller.houses[index].photos.first.url,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            width: 40,
                            height: 40,
                            child: LikeButton(
                              isLiked: controller.houses[index].wishlistCheck,
                              likeBuilder: (_) => Icon(
                                controller.houses[index].wishlistCheck
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: controller.houses[index].wishlistCheck
                                    ? kPrimaryColor
                                    : Colors.white70,
                                size: 26,
                              ),
                              onTap: (_) => controller.handleWishlistAction(
                                houseIdx: controller.houses[index].idx,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.houses[index].title,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.houses[index].address,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${controller.handleNumberFormat(controller.houses[index].point)}P (1박)",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${controller.houses[index].startDate} ~ ${controller.houses[index].endDate}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.delete<HouseController>();
                    Get.toNamed("/house/${controller.houses[index].idx}",
                        preventDuplicates: false);
                  }),
              globalDividerWidget(),
            ],
          ),
        ),
      );
}

class WishListShimmerWidget extends StatelessWidget {
  const WishListShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
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
                      width: 115,
                      height: 115,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
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
                      const SizedBox(height: 5),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: Get.width - 175,
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: Get.width - 175,
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
