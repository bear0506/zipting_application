import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class VersionImpormation extends StatefulWidget {
  const VersionImpormation({Key? key}) : super(key: key);

  @override
  _VersionImpormationState createState() => _VersionImpormationState();
}

class _VersionImpormationState extends State<VersionImpormation> {
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
            "버전 정보",
            style: TextStyle(color: kTextBodyColor),
          )),
      body: Container(
          height: double.infinity,
          child: Column(children: [
            SizedBox(height: 150),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Image.asset('assets/icons/logo_pink.png')),
            Text("이전 버전을 사용 중입니다",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("현재 버전 9.3.0",
                style: TextStyle(fontSize: 12, color: kTextBodyColor)),
            SizedBox(height: 15),
            SizedBox(
                width: 150,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)))),
                  onPressed: () {},
                  child: Text("업데이트",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ))
          ])),
    ));
  }
}
