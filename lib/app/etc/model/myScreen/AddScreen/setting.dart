import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
                "설정",
                style: TextStyle(color: kTextBodyColor),
              )),
          body: ListView(
            children: [
              Container(
                  child: Column(children: [
                SizedBox(height: 30),
                Row(children: [SizedBox(width: 25), Text("설정"), Spacer()]),
                SizedBox(height: 15),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("알림",
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
                      Text("앱 잠금 설정",
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
                      Text("채팅방",
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
                      Text("화면",
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
                      Text("검색 내역",
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
                      Text("접근 권한 설정",
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
