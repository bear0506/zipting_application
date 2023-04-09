import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class PrivateScreen extends StatelessWidget {
  const PrivateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: kTextBodyColor,
                    size: 40,
                  )),
              title: Text(
                "개인 / 보안 ",
                style: TextStyle(color: kTextBodyColor),
              )),
          body: ListView(
            children: [
              Container(
                  child: Column(children: [
                SizedBox(height: 30),
                Row(children: [SizedBox(width: 25), Text("개인정보"), Spacer()]),
                SizedBox(height: 15),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("프로필 관리",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("개인 정보 관리",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 15),
                Row(children: [SizedBox(width: 25), Text("보안"), Spacer()]),
                SizedBox(height: 15),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("화면 잠금",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("비밀번호 관리",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 15),
                Row(children: [SizedBox(width: 25), Text("보관함"), Spacer()]),
                SizedBox(height: 15),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("내 결제",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("교환 내역",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("내가 쓴 리뷰",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
              ])),
            ],
          )),
    );
  }
}
