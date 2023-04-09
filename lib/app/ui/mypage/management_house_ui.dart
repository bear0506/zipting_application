import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/management/management_house_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_dialog_widget.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';

class ManageMentHouseUi extends GetView<ManageMentHouseController> {
  const ManageMentHouseUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppbarWidget(appBar: AppBar()),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "내 집 관리",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: controller.isShimmerVisible.value == true
                        ? const ManageMentHouseShimmerWidget()
                        : const ManageMentHouseWidget(),
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
          onPressed: () {
            Get.delete<ManageMentHouseController>();
            Get.back();
          },
        ),
        actions: [
          IconButton(
            tooltip: "추가",
            icon: const Icon(Icons.add, color: Colors.black45, size: 32),
            onPressed: () => Get.toNamed("/mypage/management/house/create"),
          ),
        ],
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class ManageMentHouseWidget extends GetView<ManageMentHouseController> {
  const ManageMentHouseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.houses.isEmpty
            ? const ManageMentHouseContentEmptyWidget()
            : const ManageMentHouseContentWidget(),
      );
}

class ManageMentHouseContentEmptyWidget extends StatelessWidget {
  const ManageMentHouseContentEmptyWidget({Key? key}) : super(key: key);

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

class ManageMentHouseContentWidget extends GetView<ManageMentHouseController> {
  const ManageMentHouseContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: controller.houses.length,
          itemBuilder: (BuildContext _, int index) => InkWell(
            onTap: () => Get.toNamed("/house/${controller.houses[index].idx}",
                preventDuplicates: false),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                  ),
                  items: List.generate(
                    controller.houses[index].photos.length,
                    (index2) => Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: SizedBox(
                          width: Get.width,
                          height: 150,
                          child: Image.network(
                              controller.houses[index].photos[index2].url,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  controller.houses[index].title,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 10),
                Text(
                  controller.houses[index].address,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "${controller.houses[index].startedAt} ~ ${controller.houses[index].endedAt}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          "${controller.houses[index].point}P (1박)",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.houses[index].createdAt,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.width,
                  child: OutlinedButton(
                    child: const Text(
                      "수정",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () => Get.toNamed(
                        "/mypage/management/house/update/${controller.houses[index].idx}",
                        preventDuplicates: false),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    child: const Text(
                      "삭제",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () => globalDeleteDialogWidget(
                      content: "삭제 후 복구 할 수 없습니다.\r\n정말 삭제하시겠습니까?",
                      button: "삭제",
                      action: () {
                        controller.handleDeleteProvider(
                            houseIdx: controller.houses[index].idx);
                        Get.back(result: true);
                      },
                    ),
                  ),
                ),
                globalDividerWidget(),
              ],
            ),
          ),
        ),
      );
}

class ManageMentHouseShimmerWidget extends StatelessWidget {
  const ManageMentHouseShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext _, int index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: Get.width,
                height: 22,
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
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: Get.width - 40,
                    height: 14,
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
                width: Get.width,
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: Get.width,
                height: 22,
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
                height: 22,
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
        ),
      );
}
