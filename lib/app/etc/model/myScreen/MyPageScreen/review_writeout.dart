import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewWriteoutScreen extends StatefulWidget {
  const ReviewWriteoutScreen({Key? key}) : super(key: key);

  @override
  _ReviewWriteoutScreenState createState() => _ReviewWriteoutScreenState();
}

class _ReviewWriteoutScreenState extends State<ReviewWriteoutScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "리뷰 작성",
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: kTextBodyColor,
                    size: 40,
                  )),
              title: Text(
                "리뷰 작성",
                style: TextStyle(color: kTextBodyColor),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      //search
                    },
                    icon: Image.asset('assets/icons/search.png'))
              ],
            ),
            body: ListView(children: [
              SizedBox(height: 25),
              Row(children: [
                SizedBox(width: 10),
                Image.asset('assets/images/house_example.png',
                    width: 150, height: 160),
                SizedBox(width: 10),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("극동 행복그린 아파트", style: TextStyle(fontSize: 21)),
                      SizedBox(height: 18),
                      Text("제주시 관덕로 8길 11, 제주도"),
                      SizedBox(height: 15),
                      Text("2021.06.01 ~ 2021.06.30"),
                      SizedBox(height: 15),
                      SizedBox(
                          width: 230,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "자세히",
                                  style: TextStyle(fontSize: 13),
                                ),
                                Row(children: [
                                  Text("총 30 일",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.pink[500])),
                                  SizedBox(width: 3),
                                  Icon(IconData(0xe122,
                                      fontFamily: "MaterialIcons")),
                                ])
                              ]))
                    ])
              ]),
              SizedBox(height: 10),
              Row(children: [
                SizedBox(width: 20),
                Text("별점", style: TextStyle(fontSize: 18)),
                SizedBox(width: 20),
                RatingBar.builder(
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                  ignoreGestures: true,
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 35,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: kPrimaryColor,
                  ),
                  unratedColor: kGrey02Color,
                ),
              ]),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                child: TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "다른 여행자들이 참고할 수 있도록 이 집에서 \n 겪었던 당신의 추억을 이야기 해주세요!")),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Align(
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: kPrimaryColor)),
                            child: InkWell(
                              onTap: () {}, //사진추가버튼
                              child: Column(children: [
                                Spacer(),
                                Icon(Icons.add, size: 45, color: kPrimaryColor),
                                Text("사진 추가",
                                    style: TextStyle(color: kPrimaryColor)),
                                Spacer(),
                              ]),
                            )))
                  ])),
              SizedBox(height: 50),
              Center(
                  child: SizedBox(
                width: 140,
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)))),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                buttonPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                title: SizedBox(
                                    height: 150,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(children: [
                                            Text("리뷰가 등록되었습니다.",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(),
                                          ]),
                                          ClipRRect(
                                              child: Image.asset(
                                            'assets/images/pwdcheck_ok.png',
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ))
                                        ])),
                                actions: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "확인",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                  )
                                ]));
                  },
                  child: Text(
                    "등록하기",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              )),
              SizedBox(height: 50),
            ])));
  }
}
