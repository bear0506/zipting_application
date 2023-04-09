import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class CsScreen extends StatelessWidget {
  const CsScreen({Key? key}) : super(key: key);

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
                "고객센터 / 도움말",
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
                      Text("챗봇과 대화하기",
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
                      Text("1:1 문의",
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
                      Text("자주하는 질문",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(thickness: 2),
                Row(children: [SizedBox(width: 25), Text("도움말"), Spacer()]),
                SizedBox(height: 10),
                SizedBox(
                  width: 380,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text("도움말",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ),
                ),
                Divider(thickness: 2),
              ])),
            ],
          )),
    );
  }
}
