import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
              Widget>[
            Container(
              width: 150,
              height: 150,
              child: Image.asset(
                'assets/images/user_thumbnail.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'SolarDragon',
                      style: TextStyle(fontSize: 20, color: kBlackColor),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: kPrimaryColor,
                          ),
                          unratedColor: kGrey02Color,
                          onRatingUpdate: (double value) {},
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '10회 교환',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          '응답률 :',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '100%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    buttonPadding: EdgeInsets.zero,
                                    titlePadding:
                                        EdgeInsets.fromLTRB(16, 8, 16, 8),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    title: SizedBox(
                                        height: 60,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(children: [
                                                Text("소개",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: kTextBodyColor)),
                                                SizedBox(),
                                              ]),
                                              Container(
                                                height: 1,
                                                color: kGrey02Color,
                                              ),
                                            ])),
                                    content: Container(
                                      height: 124,
                                      width: 100,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          Text(
                                            '26살 경기도 거주하는 남성입니다.운동을 좋아해서 집에 운동 기구를 많이구비해 놓았어요. 여행 하시면서 간단',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: kTextBodyColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10))),
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "확인",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                      )
                                    ]));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(2, 2))
                              ]),
                          padding: EdgeInsets.all(8),
                          child: Text('26살 남자입니다. 운동을 좋아해서 집에 운동')),
                    ),
                  ]),
            ),
          ]),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Text('본인 인증'),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                          'assets/icons/room_detail/opponent/ok.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text('내 집 인증'),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                          'assets/icons/room_detail/opponent/ok.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text('예방접종 증명서'),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                          'assets/icons/room_detail/opponent/ok.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
