import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        height: 150,
        child: Column(children: [
          Row(children: [
            Text("최근 검색어", style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Row(children: [
                  Text("전체 삭제", style: TextStyle(color: kTextBodyColor)),
                  Image.asset("assets/icons/mypage/trashbin.png")
                ]))
          ]),
          Divider(thickness: 2),
          Expanded(
              child: ListView(scrollDirection: Axis.horizontal, children: [
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("바다 X",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black)),
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("계곡 X",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black)),
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("캠핑 X",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black)),
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("지리산 X",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black)),
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("제주도 X",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black)),
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("레몬 X",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black)),
                  )),
            ),
          ])), //최근검색어
        ]));
  }
}
