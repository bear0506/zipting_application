import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class HotSearch extends StatefulWidget {
  const HotSearch({Key? key}) : super(key: key);

  @override
  _HotSearchState createState() => _HotSearchState();
}

class _HotSearchState extends State<HotSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 3, 30, 3),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("인기 검색어", style: TextStyle(fontWeight: FontWeight.bold)),
          Divider(thickness: 2),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(children: [
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "1",
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text("제주도",
                      style: TextStyle(color: kPrimaryColor, fontSize: 20)),
                ),
                SizedBox(width: 35),
                Text("ㅡ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                    width: 30,
                    child: Text("2",
                        style: TextStyle(color: kPrimaryColor, fontSize: 20))),
                Container(
                  width: 60,
                  child: Text("여수",
                      style: TextStyle(color: kPrimaryColor, fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/up.png"),
                Text("1", style: TextStyle(color: kPrimaryColor, fontSize: 16))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "3",
                    style: TextStyle(color: kPrimaryColor, fontSize: 20),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text("춘천",
                      style: TextStyle(color: kPrimaryColor, fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/minus.png"),
                Text("1",
                    style: TextStyle(color: Colors.blue[900], fontSize: 16))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text("서핑", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Text("ㅡ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text("양양", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/up.png"),
                Text("1", style: TextStyle(color: kPrimaryColor, fontSize: 16))
              ]),
              SizedBox(height: 25),
            ]), //12345

            Column(children: [
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text("낚시", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Text("ㅡ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                    width: 30,
                    child: Text("7", style: TextStyle(fontSize: 20))),
                Container(
                  width: 60,
                  child: Text("부산", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/up.png"),
                Text("1", style: TextStyle(color: kPrimaryColor, fontSize: 16))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                    width: 30,
                    child: Text("8", style: TextStyle(fontSize: 20))),
                Container(
                  width: 60,
                  child: Text("계곡", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/minus.png"),
                Text("1",
                    style: TextStyle(color: Colors.blue[900], fontSize: 16))
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 60,
                  child: Text("월미도", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/newimage.png"),
              ]),
              SizedBox(height: 25),
              Row(children: [
                Container(
                  width: 30,
                  child: Text(
                    "10",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 60,
                  child: Text("전주", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 35),
                Image.asset("assets/icons/mypage/up.png"),
                Text("1", style: TextStyle(color: kPrimaryColor, fontSize: 16))
              ]),
              SizedBox(height: 25),
            ]) //678910
          ])
        ]));
  }
}
