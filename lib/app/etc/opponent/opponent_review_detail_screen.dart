import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zipting/app/ui/house/house_ui.dart';

class OpponentReviewDetailScreen extends StatefulWidget {
  static String routeName = '/opponent/review/detail';

  const OpponentReviewDetailScreen({Key? key}) : super(key: key);

  @override
  _OpponentReviewDetailScreenState createState() =>
      _OpponentReviewDetailScreenState();
}

class ImageState {
  final String? image;

  ImageState({
    this.image,
  });
}

List<Map<String, dynamic>> imageList = [
  {'key': 0, 'path': 'assets/images/signin.png'},
  {'key': 1, 'path': 'assets/images/signin.png'},
  {'key': 2, 'path': 'assets/images/signin.png'},
  {'key': 3, 'path': 'assets/images/signin.png'},
  {'key': 4, 'path': 'assets/images/signin.png'},
  {'key': 5, 'path': 'assets/images/signin.png'},
  {'key': 6, 'path': 'assets/images/signin.png'},
  {'key': 7, 'path': 'assets/images/signin.png'},
];

class _OpponentReviewDetailScreenState
    extends State<OpponentReviewDetailScreen> {
  Widget _buildImageList(BuildContext context, String? image, int count) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 120,
          minHeight: 120,
          maxWidth: MediaQuery.of(context).size.width / 2 - 60),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: count > 2
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )),
                      Positioned.fill(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+ ${imageList.length - 4}장',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Stack(children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ])),
      ),
    );
  }

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
        title: Text('후기 - helloOkid98',
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
      body: Container(
          padding: EdgeInsets.fromLTRB(24, 32, 24, 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            image:
                                AssetImage("assets/images/user_thumbnail.png"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: Offset(2, 2))
                        ]),
                  ),
                  SizedBox(width: 24),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          "userID",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      RatingBar.builder(
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                        allowHalfRating: true,
                        ignoreGestures: true,
                        initialRating: 3,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: kPrimaryColor,
                        ),
                        unratedColor: kGrey02Color,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "2021.05.23~2021.05.24",
                        style: TextStyle(fontSize: 10, color: kPrimaryColor),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(height: 1, color: kGrey02Color),
              Expanded(
                child: ListView(
                    padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                    children: [
                      Text(
                        '옥빛마은 17단지 아파트',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kBlackColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Text(
                          '편하게 잘 지내다 갑니다. 사진 보고 생각 했던 것보다 집이 훨씬 넓더라구요. 다음에도 여행 갈 일 있으면 꼭 재방문해야겠습니다^^!',
                          style: TextStyle(fontSize: 15, color: kBlackColor),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          ...imageList.map((e) {
                            if (imageList.indexOf(e) >= 0 &&
                                imageList.indexOf(e) < 4) {
                              return _buildImageList(
                                  context, e["path"], imageList.indexOf(e));
                            } else {
                              return SizedBox.shrink();
                            }
                          }),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 1,
                        color: kGrey02Color,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, HouseUi.routeName);
                          },
                          child: Text(
                            '집 살펴보기',
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 12),
                          ),
                        ),
                      )
                    ]),
              )
            ],
          )),
    );
  }
}
