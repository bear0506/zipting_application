import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreHelpUi extends StatelessWidget {
  const MoreHelpUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appbarWidget(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Row(
                        children: const [
                          SizedBox(width: 15),
                          Text(
                            "고객센터",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text(
                          "1:1 문의",
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
                        onTap: () => Get.dialog(
                          const Dialog(
                            child: SizedBox(
                              height: 100,
                              child: Center(
                                child: Text("1:1 문의는 준비중입니다."),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      ListTile(
                        title: const Text(
                          "자주하는 질문",
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
                        onTap: () => Get.toNamed("/qna"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          SizedBox(width: 15),
                          Text(
                            "도움말",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text(
                          "도움말",
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
                        onTap: () => Get.toNamed("/help"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // 앱바 위젯
  PreferredSizeWidget _appbarWidget() => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45, size: 32),
          tooltip: "뒤로가기",
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}
