import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/review_writeout.dart';

class ChangedState extends StatefulWidget {
  @override
  _ChangedStateState createState() => _ChangedStateState();
}

class _ChangedStateState extends State<ChangedState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: 20,
            ),
            Text(
              "현재 교환 상태",
              style: TextStyle(fontSize: 27),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/chevron-right.png',
                  width: 32, height: 50),
            )
          ],
        ),
        Spacer(),
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
                                    fontSize: 14, color: Colors.pink[500])),
                            SizedBox(width: 3),
                            Icon(IconData(0xe122, fontFamily: "MaterialIcons")),
                          ])
                        ]))
              ])
        ]),
        Spacer(),
        Divider(
          thickness: 2,
        )
      ]),
      height: 260,
    );
  }
}

class ChangeStateExchange extends StatelessWidget {
  const ChangeStateExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(1),
      child: Align(
        child: Center(
            child: Column(children: [
          Text("집 교환 기간이 만료되었습니다. \n 교환 확정 버튼을 눌러 보증금을 \n 돌려 받으세요.",
              style: TextStyle(color: Colors.white)),
          SizedBox(height: 30),
          SizedBox(
            width: 140,
            height: 40,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
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
                                        Text("보증금",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Spacer(),
                                        Text("100,000",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 5),
                                        Text("원",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))
                                      ]),
                                      Row(children: [
                                        Text("수수료(5%)",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Spacer(),
                                        Text("-4,100",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: kPrimaryColor)),
                                        SizedBox(width: 5),
                                        Text("원",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: kPrimaryColor))
                                      ]),
                                      Divider(thickness: 2),
                                      Row(children: [
                                        Text("환급금",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        Spacer(),
                                        Text("95,000",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(width: 5),
                                        Text("원",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ]),
                                      TextButton(
                                          onPressed: () {
                                            //안전거래수수료
                                          },
                                          child: Text("안전거래 수수료 규정 보기",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 8,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)))
                                    ])),
                            actions: [
                              Container(
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  buttonPadding:
                                                      EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  title: (SizedBox(
                                                    height: 150,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text("여행은 만족스러우셨나요 ?",
                                                              style: TextStyle(
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Container(height: 25),
                                                          Text("후기를 작성해주세요.")
                                                        ]),
                                                  )),
                                                  actions: [
                                                    Row(children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    kPrimaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                )),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              // Navigator.push(
                                                              //   context,
                                                              //   MaterialPageRoute(
                                                              //     builder:
                                                              //         (context) =>
                                                              //             ReviewWriteoutScreen(),
                                                              //   ),
                                                              // );
                                                            },
                                                            child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                      Text(
                                                                        "지금 작성하기",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              20),
                                                                    ]))),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                kPrimaryColor,
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            15))),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              29),
                                                                      Text(
                                                                        "다음에 할께요",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                      SizedBox(
                                                                          width:
                                                                              18)
                                                                    ]))),
                                                      )
                                                    ])
                                                  ]));
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "확인",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                              )
                            ]));
              },
              child: Text(
                "교환 확정",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ])),
      ),
      height: 150,
    );
  }
}

class NowNotChangeHome extends StatelessWidget {
  const NowNotChangeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Center(
            child: Column(children: [
          Image.asset('assets/icons/mypage/rest.png'),
          SizedBox(
            height: 10,
          ),
          Text(
            "현재 교환중인 집이 없어요!!!",
            style: TextStyle(color: kTextBodyColor, fontSize: 20),
          )
        ])));
  }
}
