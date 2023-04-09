import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileEditorReview extends StatelessWidget {
  const ProfileEditorReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Row(children: [
        Container(
          width: 20,
        ),
        Text(
          "후기",
          style: TextStyle(fontSize: 23),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/chevron-right.png',
              width: 32, height: 50),
        )
      ]),
      SizedBox(height: 10),
      ProfileEditorReviewCard(),
      ProfileEditorReviewCard()
    ]));
  }
}

class ProfileEditorReviewCard extends StatelessWidget {
  const ProfileEditorReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 40),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        image: AssetImage("assets/images/user_semi.jpeg"),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      RatingBar.builder(
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
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
                        width: 8,
                      ),
                      SizedBox(
                        child: Text(
                          "userID",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 6),
                    Container(
                      child: Text(
                        "REVIEW",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "2021.05.23~2021.05.24",
                      style: TextStyle(fontSize: 10, color: kPrimaryColor),
                      textAlign: TextAlign.right,
                    ),
                  ])
            ]));
  }
}
