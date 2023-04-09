import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class RecentSeeList extends StatefulWidget {
  @override
  _RecentSeeListState createState() => _RecentSeeListState();
}

class _RecentSeeListState extends State<RecentSeeList> {
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
                "최근 조회 내역",
                style: TextStyle(fontSize: 27),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecentPage()));
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
              RecentSeeCard(
                  housename: "멋쟁이 집",
                  cityname: "제주도",
                  point: 104,
                  image: "assets/images/ex5.jpeg",
                  stayday: 1),
              RecentSeeCard(
                  housename: "안멋쟁이 집",
                  cityname: "거제도",
                  point: 441,
                  image: "assets/images/ex6.jpeg",
                  stayday: 4),
              RecentSeeCard(
                  housename: "우리가 살고싶은 집",
                  cityname: "전라도",
                  point: 282,
                  image: "assets/images/ex7.jpeg",
                  stayday: 2),
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

class RecentSeeCard extends StatefulWidget {
  final String? housename;
  final String? cityname;
  final int? point;
  final String? image;
  final int? stayday;
  const RecentSeeCard(
      {Key? key,
      this.housename,
      this.cityname,
      this.point,
      this.image,
      this.stayday})
      : super(key: key);

  @override
  _RecentSeeCardState createState() => _RecentSeeCardState();
}

class _RecentSeeCardState extends State<RecentSeeCard> {
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('${widget.image}',
                    width: 150, height: 150, fit: BoxFit.fill)),
          ),
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
              Text("/ ${widget.stayday}박",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
      width: 190,
    );
  }
}

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

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
              "최근 조회 내역",
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
                RecentCard(),
                RecentCard(),
                RecentCard(),
                RecentCard(),
                RecentCard()
              ]),
            )
          ]))),
    );
  }
}

class RecentCard extends StatefulWidget {
  const RecentCard({Key? key}) : super(key: key);

  @override
  _RecentCardState createState() => _RecentCardState();
}

class _RecentCardState extends State<RecentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 5, 0, 30),
        child: Column(
          children: [
            Row(children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('assets/images/ex7.jpeg',
                        width: 150, height: 150, fit: BoxFit.fill)),
              ),
              SizedBox(width: 20),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("멋쟁이 집",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(" 부천시 8길 11, 경기도"),
                    SizedBox(height: 10),
                    Text("응답률 89%"),
                    SizedBox(height: 10),
                    Text(
                      "327 포인트 / 2박",
                      style: TextStyle(color: Colors.pink[500]),
                    ),
                    SizedBox(height: 10),
                    Text("2021.12.01 ~ 2021.12.30"),
                    Divider()
                  ])
            ]),
            Divider(thickness: 2)
          ],
        ));
  }
}
