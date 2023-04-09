import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

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
                  "이벤트 ",
                  style: TextStyle(color: kTextBodyColor),
                )),
            body: ListView(
              children: [
                EventCard(
                    eventtitle: "친구야 같이 여행가자! 5월 친구추천 이벤트",
                    eventterm: "2021.05.01 ~ 2021.05.31",
                    eventimage: "assets/icons/mypage/friend.png"),
                EventCard(
                    eventtitle: "나도 프사 바꿀래! 1등 DSLR! 응모하러가자!",
                    eventterm: "2021.07.01 ~ 2021.07.31",
                    eventimage: "assets/icons/mypage/lifeshot.png"),
                EventCard(
                    eventtitle: "너, 쿠폰 필요하지 않니?",
                    eventterm: "2021.09.01 ~ 2021.09.31",
                    eventimage: "assets/icons/mypage/getcoupon.png")
              ],
            )));
  }
}

class EventCard extends StatefulWidget {
  final String? eventimage;
  final String? eventtitle;
  final String? eventterm;
  const EventCard({Key? key, this.eventimage, this.eventtitle, this.eventterm})
      : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: 330,
                child: Row(
                  children: [
                    Text(
                      "${widget.eventtitle}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                  ],
                )),
            Text("기간:${widget.eventterm}",
                style: TextStyle(color: kTextBodyColor))
          ]),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('${widget.eventimage}',
                    width: 350, height: 170, fit: BoxFit.fill)),
          ),
        ],
      ),
    );
  }
}
