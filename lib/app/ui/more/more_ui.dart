import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zipting/main.dart';

class MoreUi extends StatelessWidget {
  const MoreUi({Key? key}) : super(key: key);

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
                            "개인정보",
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
                          "프로필 관리",
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
                        onTap: () => Get.toNamed("/more/profile/update"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      ListTile(
                        title: const Text(
                          "개인정보 관리",
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
                        onTap: () => Get.toNamed("/more/privacy/update"),
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
                            "보안",
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
                          "화면 잠금",
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
                                child: Text("화면 잠금은 준비중입니다."),
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
                          "비밀번호 관리",
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
                        onTap: () => Get.toNamed("/more/password/update"),
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
                            "보관함",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // ListTile(
                      //   title: const Text(
                      //     "내 결제",
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.black54,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   trailing: const Icon(
                      //     Icons.chevron_right_outlined,
                      //     color: Colors.black54,
                      //   ),
                      //   onTap: () {},
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.only(left: 15, right: 15),
                      //   child: Divider(),
                      // ),
                      ListTile(
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
                        onTap: () => Get.toNamed("/mypage/trade/all"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      ListTile(
                        title: const Text(
                          "내가 쓴 리뷰",
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
                        onTap: () {},
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
                            "설정",
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
                          "알림",
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
                                child: Text("알림 설정은 준비중입니다."),
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
                          "앱 잠금설정",
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
                                child: Text("앱 잠금설정은 준비중입니다."),
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
                          "채팅방",
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
                                child: Text("채팅방 설정은 준비중입니다."),
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
                          "화면",
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
                                child: Text("화면 설정은 준비중입니다."),
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
                          "접근 권한 설정",
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
                                child: Text("접근 권한 설정은 준비중입니다."),
                              ),
                            ),
                          ),
                        ),
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
                            "소식",
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
                          "공지사항",
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
                        onTap: () => Get.toNamed("/notice"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      ListTile(
                        title: const Text(
                          "이벤트",
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
                        onTap: () => Get.toNamed("/event"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      ListTile(
                        title: const Text(
                          "고객센터 / 도움말",
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
                        onTap: () => Get.toNamed("/more/help"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      const ListTile(
                        title: Text(
                          "버젼",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text("1.0.0"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Divider(),
                      ),
                      ListTile(
                        title: const Text(
                          "로그아웃",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(Icons.exit_to_app_outlined),
                        onTap: () {
                          GetStorage().remove("token");
                          Get.deleteAll();
                          // Get.reset();
                          Get.offAllNamed("/signin");
                        },
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
