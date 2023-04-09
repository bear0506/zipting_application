import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class MessageLiked extends StatefulWidget {
  const MessageLiked({Key? key}) : super(key: key);

  @override
  _MessageLikedState createState() => _MessageLikedState();
}

class _MessageLikedState extends State<MessageLiked> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      children: [
        Container(
          child: Stack(children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            Positioned.fill(
                child: Icon(
              Icons.add_sharp,
              size: 40,
              color: kBlackColor.withOpacity(0.5),
            )),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 1,
          color: kGrey02Color,
        )
      ],
    );
  }
}
