import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class CoronaCertificateScreen extends StatefulWidget {
  const CoronaCertificateScreen({Key? key}) : super(key: key);

  @override
  _CoronaCertificateScreenState createState() =>
      _CoronaCertificateScreenState();
}

class _CoronaCertificateScreenState extends State<CoronaCertificateScreen> {
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
            "예방접종 인증서 업로드",
            style: TextStyle(color: kTextBodyColor),
          )),
      body: Container(
          height: double.infinity,
          child: Column(children: [
            SizedBox(height: 150),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Image.asset('assets/icons/mypage/virus.png')),
            SizedBox(height: 15),
            Text("증명서가 아직 인증되지 않았습니다.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Text("인증서를 업로드 해주세요.",
                style: TextStyle(fontSize: 12, color: kTextBodyColor)),
            SizedBox(height: 20),
            SizedBox(
                width: 150,
                height: 50,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)))),
                  onPressed: () {},
                  child: Text("업로드",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ))
          ])),
    ));
  }
}
