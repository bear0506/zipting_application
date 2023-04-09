import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'MessageAll.dart';
import 'MessageLiked.dart';
import 'MessageUnread.dart';

class MessageScreen extends StatefulWidget {
  static String routeName = '/message';

  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String bigImage = 'assets/icons/search.png';
  String smallImage = 'assets/icons/search_small.png';
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar =
      Text("", style: TextStyle(color: Colors.black, fontSize: 25));
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              // indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              unselectedLabelColor: kBlackColor,
              tabs: [
                Tab(
                  text: '전체보기',
                ),
                Tab(text: '안읽은메세지(0)'),
                Tab(
                  text: '즐겨찾기(0)',
                ),
              ]),
          title: cusSearchBar,
          backgroundColor: Colors.white,
          toolbarHeight: 72,
          shadowColor: Colors.transparent,
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       setState(() {
          //         if (this.bigImage == 'assets/icons/search.png') {
          //           this.bigImage = this.smallImage;
          //           this.cusSearchBar = TextField(
          //             textInputAction: TextInputAction.go,
          //             decoration: InputDecoration(
          //                 hintText: '어떤 대화를 찾고 계신가요?',
          //                 border: InputBorder.none),
          //             style: TextStyle(
          //               color: kBlackColor,
          //               fontSize: 15,
          //             ),
          //           );
          //         } else {
          //           this.bigImage = 'assets/icons/search.png';
          //           this.cusSearchBar = Text("마이페이지",
          //               style: TextStyle(color: Colors.black, fontSize: 25));
          //         }
          //       });
          //     },
          //     child: Image.asset(bigImage, width: 30, height: 30),
          //   )
          // ],
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          // children: [MessageAll(), MessageLiked(), MessageUnread()],
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("메세지가 없습니다."),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("메세지가 없습니다."),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("메세지가 없습니다."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
