import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class MessageUnread extends StatefulWidget {
  const MessageUnread({Key? key}) : super(key: key);

  @override
  _MessageUnreadState createState() => _MessageUnreadState();
}

class _MessageUnreadState extends State<MessageUnread> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        children: [
          Message(),
          Divider(height: 1, color: kGrey02Color),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("assets/images/user_thumbnail.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'RedcheEkS2',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '21.05.06',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 64,
                      child: Text(
                        '안녕하세요! 제가 이번에 수도권 쪽에서 한달 살기를 하려고 하는데 사진보고 집 너무 맘에 들어서 연락드립니다! 혹시 집 사진 ...',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '교환 취소',
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
