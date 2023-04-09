import 'package:flutter/material.dart';

class BottomNavigaionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 60,
        child: TabBar(
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.pink,
            tabs: [
              Tab(
                iconMargin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                icon: Image.asset(
                  'assets/icons/home.png',
                  height: 20,
                  width: 20,
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                icon: Image.asset(
                  'assets/icons/message.png',
                  height: 30,
                  width: 30,
                ),
                child: Text(
                  '채팅',
                  style: TextStyle(fontSize: 9),
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                icon: Image.asset(
                  'assets/icons/search_small.png',
                  height: 30,
                  width: 30,
                ),
                child: Text(
                  '검색',
                  style: TextStyle(fontSize: 9),
                ),
              ),
              Tab(
                iconMargin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                icon: Image.asset(
                  'assets/icons/my.png',
                  height: 30,
                  width: 30,
                ),
                child: Text(
                  'MY',
                  style: TextStyle(fontSize: 9),
                ),
              ),
            ]),
      ),
    );
  }
}
