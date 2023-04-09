import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/ProfileEditior/profile_editor_myhouse.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/ProfileEditior/profile_editor_review.dart';

class ProfileEditorScreen extends StatefulWidget {
  const ProfileEditorScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditorScreenState createState() => _ProfileEditorScreenState();
}

class _ProfileEditorScreenState extends State<ProfileEditorScreen> {
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
            "프로필 편집",
            style: TextStyle(color: kTextBodyColor),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Container(
                height: 220,
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  Row(children: [
                    SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.2,
                                blurRadius: 4,
                                offset: Offset(3, 3))
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          'https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2019/12/PS19120300014.jpg',
                          width: 130,
                          height: 130,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("[007Yang]",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 10),
                          Row(children: [
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
                          ]), //star and 2회교환
                          SizedBox(height: 10),
                          Text("응답률 : 100%"),
                          SizedBox(height: 10),
                          Container(
                            width: 190,
                            height: 60,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: Text("28살 직장인입니다. 휴가철 맞교환 위주로 여행하고 있습니다",
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                          )
                        ])
                  ]),
                  SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            Text('본인 인증',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                            Text('내 집 인증',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                            Text('예방접종 증명서',
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                ])),
            Divider(thickness: 2),
            // Expanded(
            //   child: ListView(
            //     children: [ProfileEditorMyhome(), ProfileEditorReview()],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
