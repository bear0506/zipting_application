import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
// import 'package:zipting/app/widgets/like_button_widget.dart';

class KeepList extends StatefulWidget {
  @override
  _KeepListState createState() => _KeepListState();
}

class _KeepListState extends State<KeepList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20,
              ),
              Text(
                "찜 목록",
                style: TextStyle(fontSize: 27),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KeepListPage()));
                },
                icon: Image.asset('assets/icons/chevron-right.png',
                    width: 32, height: 50),
              )
            ],
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 20,
              ),
              KeepCard(
                  housename: "모던 레이보우 하우스",
                  cityname: "제주도",
                  point: 504,
                  image: "assets/images/ex1.jpeg"),
              KeepCard(
                  housename: "W & B 하우스 7구역",
                  cityname: "경기도",
                  point: 241,
                  image: "assets/images/ex2.jpeg"),
              KeepCard(
                  housename: "자연 속에 사는 삶",
                  cityname: "전라도",
                  point: 232,
                  image: "assets/images/ex3.jpeg"),
              KeepCard(
                  housename: "굿모닝 프라자",
                  cityname: "상동",
                  point: 629,
                  image: "assets/images/ex4.jpeg"),
            ],
          )),
          Divider(
            thickness: 2,
          )
        ],
      ),
      height: 300,
    );
  }
}

class KeepCard extends StatefulWidget {
  final String? housename;
  final String? cityname;
  final int? point;
  final String? image;

  const KeepCard(
      {Key? key, this.housename, this.cityname, this.point, this.image})
      : super(key: key);

  @override
  _KeepCardState createState() => _KeepCardState();
}

class _KeepCardState extends State<KeepCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('${widget.image}',
                        width: 150, height: 150, fit: BoxFit.fill)),
                // Positioned(
                //   top: 5,
                //   left: 115,
                //   child: LikeButtonWidget(),
                // ),
              ])),
          SizedBox(height: 5),
          Text("${widget.housename}",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("${widget.cityname}",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            children: [
              Text("${widget.point} 포인트",
                  style: TextStyle(fontSize: 12, color: Colors.pink[500])),
              Text("/ 1박",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
      width: 190,
    );
  }
}

class KeepListPage extends StatelessWidget {
  const KeepListPage({Key? key}) : super(key: key);

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
              "찜 목록",
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
          body: Container(
              child: Column(children: [
            SizedBox(height: 15),
            Expanded(
              child: ListView(children: [
                KeepListCard(),
                KeepListCard(),
                KeepListCard(),
                KeepListCard(),
                KeepListCard()
              ]),
            )
          ]))),
    );
  }
}

class KeepListCard extends StatefulWidget {
  const KeepListCard({Key? key}) : super(key: key);

  @override
  _KeepListCardState createState() => _KeepListCardState();
}

class _KeepListCardState extends State<KeepListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 30),
        child: Column(children: [
          Row(children: [
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/images/ex2.jpeg',
                          width: 150, height: 150, fit: BoxFit.fill)),
                  // Positioned(
                  //   top: 5,
                  //   left: 115,
                  //   child: LikeButtonWidget(),
                  // ),
                ])),
            SizedBox(width: 20),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("극동 행복그린 아파트",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("제주시 관덕로 8길 11, 제주도"),
                  SizedBox(height: 10),
                  Text("응답률 100%"),
                  SizedBox(height: 10),
                  Text(
                    "287 포인트 / 1박",
                    style: TextStyle(color: Colors.pink[500]),
                  ),
                  SizedBox(height: 10),
                  Text("2021.06.01 ~ 2021.06.30"),
                  Divider()
                ])
          ]),
          Divider(thickness: 2)
        ]));
  }
}
