import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/notice/notice_controller.dart';

class NoticeUi extends StatelessWidget {
  NoticeUi({Key? key}) : super(key: key);

  final NoticeController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appbarWidget(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: controller.isShimmerVisible.value == true
                  ? _noticeContentShimmerWidget()
                  : _noticeContentWidget(),
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
            Get.delete<NoticeController>();
            Get.back();
          },
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );

  // 공지사항 위젯
  Widget _noticeContentWidget() => ListView.builder(
        shrinkWrap: true,
        itemCount: controller.notices.length,
        itemBuilder: (BuildContext _, int index) => ExpansionTile(
          initiallyExpanded: false,
          childrenPadding:
              const EdgeInsets.only(left: 17, top: 20, right: 17, bottom: 20),
          expandedAlignment: Alignment.centerLeft,
          title: Wrap(
            children: [
              Text(
                controller.notices[index].title,
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
                  controller.notices[index].content,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    controller.notices[index].createdAt,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  // 공지사항 쉬머 위젯
  Widget _noticeContentShimmerWidget() => ListView.builder(
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
