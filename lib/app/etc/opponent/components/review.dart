// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:zipting/app/core/values/colors.dart';
// import '../opponent_review_screen.dart';
// import '../opponent_review_detail_screen.dart';

// class ReviewList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
//       child: Column(children: [
//         InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, OpponentReviewScreen.routeName);
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 '후기',
//                 style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon:
//                       Image.asset('assets/icons/chevron-right.png', width: 14))
//             ],
//           ),
//         ),
//         SizedBox(height: 24),
//         Review(),
//         SizedBox(
//           height: 30,
//         ),
//         Review(),
//         SizedBox(
//           height: 30,
//         ),
//         Review(),
//       ]),
//     );
//   }
// }

// class Review extends StatefulWidget {
//   // final String userId;
//   // final double rating;
//   // final String review;
//   // final String image;
//   // final String date;
//   //
//   // Review({this.userId, this.rating, this.review, this.image, this.date});

//   // const Review(
//   //     {Key key, this.userId, this.rating, this.review, this.image, this.date})
//   //     : super(key: key);

//   @override
//   _ReviewState createState() => _ReviewState();
// }

// class _ReviewState extends State<Review> {
//   // var _userId;
//   // var _rating;
//   // var _review;
//   // var _image;
//   // var _date;
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   setState(() {
//   //     _userId = this.widget.userId;
//   //     _rating = this.widget.rating;
//   //     _review = this.widget.review;
//   //     _image = this.widget.image;
//   //     _date = this.widget.date;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, OpponentReviewDetailScreen.routeName);
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 90,
//             height: 90,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: new DecorationImage(
//                     image: AssetImage("assets/images/user_thumbnail.png"),
//                     fit: BoxFit.fill),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       blurRadius: 2,
//                       spreadRadius: 2,
//                       offset: Offset(2, 2))
//                 ]),
//           ),
//           SizedBox(width: 24),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(children: [
//                 RatingBar.builder(
//                   onRatingUpdate: (rating) {
//                     print(rating);
//                   },
//                   initialRating: 3,
//                   direction: Axis.horizontal,
//                   itemCount: 5,
//                   itemSize: 20,
//                   itemBuilder: (context, _) => Icon(
//                     Icons.star,
//                     color: kPrimaryColor,
//                   ),
//                   unratedColor: kGrey02Color,
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 SizedBox(
//                   child: Text(
//                     "userID",
//                     style: TextStyle(
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ]),
//               SizedBox(height: 6),
//               Container(
//                 child: Text(
//                   "REVIEW",
//                   style: TextStyle(
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Text(
//                 "2021.05.23~2021.05.24",
//                 style: TextStyle(fontSize: 10, color: kPrimaryColor),
//                 textAlign: TextAlign.right,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
