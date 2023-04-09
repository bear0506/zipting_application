import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({Key? key}) : super(key: key);

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
                "쿠폰함",
                style: TextStyle(color: kTextBodyColor),
              ),
            ),
            body: Column(children: [
              Expanded(
                  child: ListView(
                children: [
                  Coupon(
                    title: "Welcome 쿠폰",
                    body: "첫 교환시 보증금 수수료 면제",
                    autoDo: "자동사용",
                    doDay: "2021.09.10~2021.09.11",
                    remainDay: 60,
                  ),
                  Coupon(
                    title: "Welcome 쿠폰2",
                    body: "첫 교환시 포인트 지역 면제",
                    autoDo: "자동사용",
                    doDay: "2021.09.10~2021.09.31",
                    remainDay: 21,
                  )
                ],
              ))
            ])));
  }
}

class Coupon extends StatefulWidget {
  final String? title;
  final String? body;
  final String? autoDo;
  final String? doDay;
  final int? remainDay;

  const Coupon(
      {Key? key,
      this.title,
      this.body,
      this.autoDo,
      this.doDay,
      this.remainDay})
      : super(key: key);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        height: 130,
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 10),
            Text("${widget.title}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("${widget.body}", style: TextStyle(color: kPrimaryColor)),
            Text("(${widget.autoDo}) ", style: TextStyle(color: kPrimaryColor)),
            SizedBox(height: 8),
            Text("${widget.doDay}",
                style: TextStyle(fontSize: 11, color: kTextBodyColor)),
          ]),
          Spacer(),
          Container(
              height: double.infinity,
              width: 100,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey, offset: Offset(3, 2))
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: kPrimaryColor),
              child: Center(
                  child: Text(
                "${widget.remainDay}일 \n남음",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )))
        ]));
  }
}
