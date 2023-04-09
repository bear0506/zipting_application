import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class OpponentHouseScreen extends StatefulWidget {
  static String routeName = '/opponent/house';
  @override
  _OpponentHouseScreenState createState() => _OpponentHouseScreenState();
}

class _OpponentHouseScreenState extends State<OpponentHouseScreen> {
  String bigImage = 'assets/icons/search.png';
  String smallImage = 'assets/icons/search_small.png';
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('solardragon님의 집',
      style: TextStyle(
        color: kTextBodyColor,
        fontSize: 25,
      ));
  Widget SearchBar = Container(
    width: 90,
    height: 30,
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        TextField(
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
              hintText: '어떤 집을 찾고 계신가요?', border: InputBorder.none),
          style: TextStyle(
            color: kBlackColor,
            fontSize: 15,
          ),
        ),
        Image.asset('assets/icons/search_small.png', width: 24, height: 24)
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('assets/icons/chevron-left-thin.png',
              width: 24, height: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: cusSearchBar,
        bottom: PreferredSize(
          child: Container(
            color: kGrey02Color,
            height: 1,
          ),
          preferredSize: Size.fromHeight(1),
        ),
        shadowColor: Colors.transparent,
        toolbarHeight: 80,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                if (this.bigImage == 'assets/icons/search.png') {
                  this.bigImage = this.smallImage;
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        hintText: '어떤 집을 찾고 계신가요?', border: InputBorder.none),
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 15,
                    ),
                  );
                } else {
                  this.bigImage = 'assets/icons/search.png';
                  this.cusSearchBar = Text('solardragon님의 집',
                      style: TextStyle(
                        color: kTextBodyColor,
                        fontSize: 25,
                      ));
                }
              });
            },
            child: Image.asset(bigImage, width: 30, height: 30),
          )
        ],
      ),
      body: Container(
        child: ListView(children: [
          HouseList(),
          Divider(
            height: 1,
            color: kGrey02Color,
          ),
          HouseList(),
          Divider(
            height: 1,
            color: kGrey02Color,
          ),
          HouseList(),
          Divider(
            height: 1,
            color: kGrey02Color,
          ),
        ]),
      ),
    );
  }
}

class HouseList extends StatelessWidget {
  const HouseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/house_example.png',
              width: 150, height: 160),
          SizedBox(
            width: 7,
          ),
          Container(
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("극동 행복그린 아파트", style: TextStyle(fontSize: 20)),
                SizedBox(height: 18),
                Text("제주시 관덕로 8길 11, 제주도"),
                SizedBox(height: 15),
                Text(
                  "400 포인트 / 1박",
                  style: TextStyle(color: kPrimaryColor),
                ),
                SizedBox(height: 15),
                Text("2021.01.15 ~ 2021.07.21", style: TextStyle(fontSize: 15)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
