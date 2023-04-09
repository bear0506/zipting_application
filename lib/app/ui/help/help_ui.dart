import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/help/help_controller.dart';

class HelpUi extends StatelessWidget {
  HelpUi({Key? key}) : super(key: key);

  final HelpController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appbarWidget(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: controller.isShimmerVisible.value == true
                  ? _helpContentShimmerWidget()
                  : _helpContentWidget(),
            ),
          ),
        ),
      );

  // 앱바 위젯
  PreferredSizeWidget _appbarWidget() => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45, size: 32),
          tooltip: "뒤로가기",
          onPressed: () {
            Get.delete<HelpController>();
            Get.back();
          },
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );

  // 도움말 컨텐츠 위젯
  Widget _helpContentWidget() => ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: false,
            childrenPadding:
                const EdgeInsets.only(left: 17, top: 20, right: 17, bottom: 20),
            expandedAlignment: Alignment.centerLeft,
            title: Wrap(
              children: [
                Text(
                  "도움말1",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            children: [
              Wrap(
                children: [
                  Text(
                    "도움말1 내용",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            initiallyExpanded: false,
            childrenPadding:
                const EdgeInsets.only(left: 17, top: 20, right: 17, bottom: 20),
            expandedAlignment: Alignment.centerLeft,
            title: Wrap(
              children: [
                Text(
                  "도움말2",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            children: [
              Wrap(
                children: [
                  Text(
                    "도움말2 내용",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  // 도움말 컨텐츠 쉬머 위젯
  Widget _helpContentShimmerWidget() => ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext _, int index) => Column(
          children: [
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
          ],
        ),
      );
}
