import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zipting/app/controller/qna/qna_controller.dart';

class QnaUi extends StatelessWidget {
  QnaUi({Key? key}) : super(key: key);

  final QnaController controller = Get.find();

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appbarWidget(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: controller.isShimmerVisible.value == true
                  ? _qnaContentShimmerWidget()
                  : _qnaContentWidget(),
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
            Get.delete<QnaController>();
            Get.back();
          },
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );

  // QNA 컨텐츠 위젯
  Widget _qnaContentWidget() => ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: false,
            childrenPadding:
                const EdgeInsets.only(left: 17, top: 20, right: 17, bottom: 20),
            expandedAlignment: Alignment.centerLeft,
            title: Wrap(
              children: [
                Text(
                  "본인 명의 휴대전화와 계좌가 없어도 되나요?",
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
                    "카카오계정으로 회원 가입 후 시세, 코인 정보 및 공지사항 등에 대한 확인은 가능합니다. 하지만 국내 통신사를 이용하는 본인 명의의 휴대전화, 케이뱅크 입출금 계좌 및 카카오페이 인증서가 없다면 입출금 및 거래에 제한이 있습니다.",
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
                  "해외에서도 이용 가능한가요?",
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
                    "해외에서도 아래의 3가지 조건을 충족하면 업비트를 이용할 수는 있으나 아래의 설명과 같이 사용이 제한될 수 있습니다. 해외에서의 원활한 이용을 위해 국내에서 미리 케이뱅크 입출금 계좌 인증과 카카오페이 인증 완료를 권장드립니다.",
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
  // child: ListView.builder(
  //   shrinkWrap: true,
  //   itemCount: controller.events.length,
  //   itemBuilder: (BuildContext _, int index) => ExpansionTile(
  //     initiallyExpanded: false,
  //     childrenPadding: const EdgeInsets.only(
  //         left: 17, top: 20, right: 17, bottom: 20),
  //     expandedAlignment: Alignment.centerLeft,
  //     title: Wrap(
  //       children: [
  //         Text(
  //           controller.events[index].title,
  //           style: const TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ],
  //     ),
  //     children: [
  //       Wrap(
  //         children: [
  //           Text(
  //             controller.events[index].content,
  //             style: const TextStyle(
  //               fontSize: 16,
  //               color: Colors.black54,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 20),
  //       Wrap(
  //         children: [
  //           Align(
  //             alignment: Alignment.centerRight,
  //             child: Text(
  //               controller.events[index].createdAt,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //                 color: Colors.black54,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   ),
  // ),

  // QNA 컨텐츠 쉬머 위젯
  Widget _qnaContentShimmerWidget() => ListView.builder(
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
