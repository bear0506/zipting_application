import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class OpponentMoreScreen extends StatelessWidget {
  static String routeName = '/opponent/more';

  const OpponentMoreScreen({Key? key}) : super(key: key);

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
          title: Text('더보기',
              style: TextStyle(
                color: kTextBodyColor,
                fontSize: 25,
              )),
          bottom: PreferredSize(
            child: Container(
              color: kGrey02Color,
              height: 1,
            ),
            preferredSize: Size.fromHeight(1),
          ),
          shadowColor: Colors.transparent,
          toolbarHeight: 80,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '태그',
                  style: TextStyle(
                      color: kBlackColor.withOpacity(0.7), fontSize: 12),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      '#복층',
                      style: TextStyle(
                          fontSize: 20,
                          color: kBlackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '#여름',
                      style: TextStyle(
                          fontSize: 20,
                          color: kBlackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Text(
                      '#자연',
                      style: TextStyle(
                          fontSize: 20,
                          color: kBlackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: kGrey02Color,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      '태그',
                      style: TextStyle(
                          color: kBlackColor.withOpacity(0.7), fontSize: 12),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          '본인 인증',
                          style: TextStyle(
                              fontSize: 20,
                              color: kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/icons/room_detail/opponent/ok.png',
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          '내 집 인증',
                          style: TextStyle(
                              fontSize: 20,
                              color: kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/icons/room_detail/opponent/ok.png',
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          '예방접종 인증서',
                          style: TextStyle(
                              fontSize: 20,
                              color: kBlackColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/icons/room_detail/opponent/ok.png',
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Divider(
                      height: 1,
                      color: kGrey02Color,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Divider(
                  height: 1,
                  color: kGrey02Color,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '지도에서 확인하기',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                                side: BorderSide(color: Colors.transparent)))),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
