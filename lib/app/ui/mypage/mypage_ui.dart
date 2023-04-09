import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:zipting/app/controller/house/house_controller.dart';
import 'package:zipting/app/controller/mypage/mypage_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:zipting/app/global_widgets/global_dialog_widget.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';

class MyPageUi extends GetView<MyPageController> {
  const MyPageUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppbarWidget(appBar: AppBar()),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: controller.isShimmerVisible.value == false
                    ? Column(
                        children: const [
                          SizedBox(height: 20),
                          MypageProfileWidget(),
                          MyPageHouseManagement(),
                          MyPageHouseTradeWidget(),
                          MyPageWishListWidget(),
                          MyPageSearchRecentWidget(),
                        ],
                      )
                    : Column(
                        children: const [Text("로딩중")],
                      ),
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
        actions: [
          IconButton(
            tooltip: "설정",
            icon: const Icon(Icons.settings_outlined,
                color: Colors.black45, size: 26),
            onPressed: () => Get.toNamed("/more"),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.5,
      );
}

class MypageProfileWidget extends GetView<MyPageController> {
  const MypageProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 115,
                  height: 115,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(controller.user.first.photo),
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
                    Text(
                      controller.user.first.nickname,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    Text(
                      "${controller.user.first.points}P",
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            globalDividerWidget(bottom: 10),
          ],
        ),
      );
}

class MyPageHouseManagement extends StatelessWidget {
  const MyPageHouseManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                // leading: const Icon(
                //   Icons.home_work_outlined,
                //   color: Colors.black54,
                // ),
                title: const Text(
                  "내 집 관리",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.black54,
                ),
                onTap: () => Get.toNamed("/mypage/management/house"),
              ),
              ListTile(
                // leading: const Icon(
                //   Icons.home_work_outlined,
                //   color: Colors.black54,
                // ),
                title: const Text(
                  "교환 내역",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.black54,
                ),
                onTap: () => Get.toNamed("/mypage/trade/history"),
              ),
            ],
          ),
          globalDividerWidget(top: 10, bottom: 10),
        ],
      );
}

class MyPageHouseTradeWidget extends GetView<MyPageController> {
  const MyPageHouseTradeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "교환 요청내역",
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
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () => Get.toNamed("/mypage/trade/all"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            controller.trades.isEmpty
                ? const MyPageHouseTradeContentEmptyWidget()
                : const MyPageHouseTradeContentWidget(),
            globalDividerWidget(top: 10, bottom: 10),
          ],
        ),
      );
}

class MyPageHouseTradeContentEmptyWidget extends StatelessWidget {
  const MyPageHouseTradeContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sailing_rounded,
              color: Colors.grey.shade300,
              size: 56,
            ),
            const SizedBox(height: 30),
            Text(
              "현재 교환 상태가 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 26,
              ),
            )
          ],
        ),
      );
}

class MyPageHouseTradeContentWidget extends GetView<MyPageController> {
  const MyPageHouseTradeContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => CarouselSlider(
          options: CarouselOptions(
            height: 370,
            viewportFraction: 1,
          ),
          items: controller.trades
              .map(
                (value) => Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: InkWell(
                    onTap: () {
                      Get.delete<HouseController>();
                      Get.toNamed("/house/${value.idx}",
                          preventDuplicates: false);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: SizedBox(
                            width: Get.width,
                            height: 150,
                            child: Image.network(value.photos[0].url,
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          value.title,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 22,
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
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${value.start} ~ ${value.end}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${value.point}P (1박)",
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            child: const Text(
                              "교환확정",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: () => globalDeleteDialogWidget(
                              content: "교환 확정 후 취소할 수 없습니다.\r\n정말 확정하시겠습니까?",
                              button: "교환확정",
                              action: () {
                                controller.handleTradeUpdateProvider(
                                    type: "교환확정",
                                    tradeIdx: value.tradeIdx,
                                    houseIdx: value.idx);
                                Get.back(result: true);
                                globalSnackBarWidget(message: "교환이 확정되었습니다.");
                              },
                            ),
                          ),
                        ),
                        // const SizedBox(height: 20),
                        SizedBox(
                          width: Get.width,
                          child: OutlinedButton(
                            child: const Text(
                              "교환거절",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: () => globalDeleteDialogWidget(
                              content: "교환 거절 후 철회할 수 없습니다.\r\n정말 거절하시겠습니까?",
                              button: "교환거절",
                              action: () {
                                controller.handleTradeDeleteProvider(
                                    tradeIdx: value.tradeIdx,
                                    houseIdx: value.idx);
                                Get.back(result: true);
                                globalSnackBarWidget(message: "교환이 거절되었습니다.");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
}

class MyPageWishListWidget extends GetView<MyPageController> {
  const MyPageWishListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "찜 목록",
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
                  onPressed: () => Get.toNamed("/mypage/wishlist/all"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            controller.wishlists.isEmpty
                ? const MyPageWishListContentEmptyWidget()
                : const MyPageWishListContentWidget(),
            globalDividerWidget(top: 10, bottom: 10),
          ],
        ),
      );
}

class MyPageWishListContentEmptyWidget extends StatelessWidget {
  const MyPageWishListContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.grey.shade300,
              size: 56,
            ),
            const SizedBox(height: 30),
            Text(
              "찜 목록이 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 26,
              ),
            )
          ],
        ),
      );
}

class MyPageWishListContentWidget extends GetView<MyPageController> {
  const MyPageWishListContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.wishlists.length,
            itemBuilder: (BuildContext _, int index) => InkWell(
              onTap: () {
                Get.delete<HouseController>();
                Get.toNamed("/house/${controller.wishlists[index].idx}",
                    preventDuplicates: false);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.network(
                                controller.wishlists[index].photos[0].url,
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          width: 50,
                          height: 50,
                          child: LikeButton(
                            isLiked: controller.wishlists[index].wishlistCheck,
                            likeBuilder: (_) => Icon(
                              controller.wishlists[index].wishlistCheck
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: controller.wishlists[index].wishlistCheck
                                  ? kPrimaryColor
                                  : Colors.white70,
                              size: 26,
                            ),
                            onTap: (_) => controller.handleWishlistAction(
                              houseIdx: controller.wishlists[index].idx,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.wishlists[index].title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.wishlists[index].address,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${controller.wishlists[index].point}P (1박)",
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class MyPageSearchRecentWidget extends GetView<MyPageController> {
  const MyPageSearchRecentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "최근 조회 내역",
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
                  onPressed: () => Get.toNamed("/mypage/search/recent/all"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            controller.searchRecents.isEmpty
                ? const MyPageSearchRecentContentEmptyWidget()
                : const MyPageSearchRecentContentWidget(),
            const SizedBox(height: 10),
          ],
        ),
      );
}

class MyPageSearchRecentContentEmptyWidget extends StatelessWidget {
  const MyPageSearchRecentContentEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_outlined,
              color: Colors.grey.shade300,
              size: 56,
            ),
            const SizedBox(height: 30),
            Text(
              "최근 조회 내역이 없습니다.",
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 26,
              ),
            )
          ],
        ),
      );
}

class MyPageSearchRecentContentWidget extends GetView<MyPageController> {
  const MyPageSearchRecentContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.searchRecents.length,
            itemBuilder: (BuildContext _, int index) => InkWell(
              onTap: () {
                Get.delete<HouseController>();
                Get.toNamed("/house/${controller.searchRecents[index].idx}",
                    preventDuplicates: false);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.network(
                                controller.searchRecents[index].photos[0].url,
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          width: 50,
                          height: 50,
                          child: LikeButton(
                            isLiked:
                                controller.searchRecents[index].wishlistCheck,
                            likeBuilder: (_) => Icon(
                              controller.searchRecents[index].wishlistCheck
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color:
                                  controller.searchRecents[index].wishlistCheck
                                      ? kPrimaryColor
                                      : Colors.white70,
                              size: 26,
                            ),
                            onTap: (_) =>
                                controller.handleSearchRecentsWishlistAction(
                              houseIdx: controller.searchRecents[index].idx,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.searchRecents[index].title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.searchRecents[index].address,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${controller.searchRecents[index].point}P (1박)",
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
