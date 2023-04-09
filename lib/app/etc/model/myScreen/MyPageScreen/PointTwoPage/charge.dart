import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class ChargePage extends StatefulWidget {
  const ChargePage({Key? key}) : super(key: key);

  @override
  _ChargePageState createState() => _ChargePageState();
}

class _ChargePageState extends State<ChargePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: kTextBodyColor,
                  size: 40,
                )),
            title: Text(
              "포인트 충전",
              style: TextStyle(color: kTextBodyColor),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                child: ListView(
                  children: [
                    Payway(),
                    ChargeMoney(),
                    ChargeEmail(),
                    TermsOfUse(),
                  ],
                ),
              )),
              SizedBox(
                width: 380,
                height: 60,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)))),
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
                                            Text("포인트가 충전 되었습니다.",
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
                  child: Text("충전하기",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}

class Payway extends StatefulWidget {
  const Payway({Key? key}) : super(key: key);

  @override
  _PaywayState createState() => _PaywayState();
}

class _PaywayState extends State<Payway> {
  // int _value = 1;
  var _isChanging = true;
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      SizedBox(height: 25),
      Row(children: [
        SizedBox(width: 15),
        Text("결제 방법",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Spacer()
      ]),
      SizedBox(height: 25),
      Container(
        width: 380,
        height: 100,
        padding: EdgeInsets.fromLTRB(15, 15, 6, 0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: Row(children: [
                Text("계좌 간편 결제",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Transform.scale(
                  scale: 1.8,
                  child: Checkbox(
                      fillColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: CircleBorder(),
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value;
                        });
                      }),
                )
              ]),
            ),
            SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Expanded(
                      child: _isChanging
                          ? Text("신한 123-456-789-131")
                          : Container(
                              width: 100,
                              child: TextField(
                                decoration: InputDecoration(
                                    focusedBorder: InputBorder.none),
                              )),
                    ),
                    // SizedBox(width: 20),
                    TextButton(
                        onPressed: () {
                          //change button
                          setState(() {
                            _isChanging = false;
                          });
                        },
                        child: Text(
                          "변경",
                          style: TextStyle(fontSize: 11, color: kPrimaryColor),
                        ))
                  ],
                ))
          ],
        ),
      ),
      Container(
        width: 380,
        height: 80,
        padding: EdgeInsets.fromLTRB(15, 18, 5, 0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: Row(children: [
                Text("카드 간편 결제",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Transform.scale(
                  scale: 1.8,
                  child: Checkbox(
                      fillColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: CircleBorder(),
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value;
                        });
                      }),
                )
              ]),
            ),
          ],
        ),
      ),
      Container(
        width: 380,
        height: 80,
        padding: EdgeInsets.fromLTRB(15, 18, 5, 0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(children: [
          SizedBox(
            height: 35,
            child: Row(children: [
              Text("카드 일반 결제",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Transform.scale(
                scale: 1.8,
                child: Checkbox(
                    fillColor: MaterialStateProperty.all(kPrimaryColor),
                    shape: CircleBorder(),
                    value: _isChecked3,
                    onChanged: (value) {
                      setState(() {
                        _isChecked3 = value;
                      });
                    }),
              )
            ]),
          ),
        ]),
      )
    ]));
  }
}

class ChargeMoney extends StatefulWidget {
  const ChargeMoney({Key? key}) : super(key: key);

  @override
  _ChargeMoneyState createState() => _ChargeMoneyState();
}

class _ChargeMoneyState extends State<ChargeMoney> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      SizedBox(height: 10),
      Row(children: [
        SizedBox(width: 15),
        Text("충전 금액",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Spacer()
      ]),
      SizedBox(height: 30),
      SizedBox(
        width: 380,
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "금액을 입력해주세요 .",
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
      ),
      SizedBox(height: 10),
      Divider(
        thickness: 2,
      ),
    ]));
  }
}

class ChargeEmail extends StatefulWidget {
  const ChargeEmail({Key? key}) : super(key: key);

  @override
  _ChargeEmailState createState() => _ChargeEmailState();
}

class _ChargeEmailState extends State<ChargeEmail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(children: [
          SizedBox(width: 15),
          Text("결제내역 수신 이메일 (필수)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Spacer(),
        ]),
        SizedBox(height: 30),
        SizedBox(
          width: 380,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "example@Zipting.co.kr",
                hintStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  bool? _isChecked4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ListView(
        padding: EdgeInsets.only(top: 20),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ExpansionTile(
            title: Flexible(
              child: Row(children: [
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                      fillColor: MaterialStateProperty.all(kPrimaryColor),
                      value: _isChecked4,
                      onChanged: (value) {
                        setState(() {
                          _isChecked4 = value;
                        });
                      }),
                ),
                Text("[필수]", style: TextStyle(color: Colors.redAccent)),
                SizedBox(width: 3),
                Text('전자금융거래 이용약관'),
              ]),
            ),
            children: [
              Text("이용약관입니다") //이용약관
            ],
          ),
        ],
      ),
      SizedBox(height: 50)
    ]));
  }
}
