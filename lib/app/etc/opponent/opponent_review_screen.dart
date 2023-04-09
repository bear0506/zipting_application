// import 'package:flutter/material.dart';
// import 'package:zipting/app/core/values/colors.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:zipting/app/ui/opponent/opponent_review_detail_screen.dart';

// class OpponentReviewScreen extends StatefulWidget {
//   static String routeName = '/opponet/review';
//   const OpponentReviewScreen({Key? key}) : super(key: key);

//   @override
//   _OpponentReviewScreenState createState() => _OpponentReviewScreenState();
// }

// class _OpponentReviewScreenState extends State<OpponentReviewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Image.asset('assets/icons/chevron-left-thin.png',
//               width: 24, height: 24),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         title: Text('후기',
//             style: TextStyle(
//               color: kTextBodyColor,
//               fontSize: 25,
//             )),
//         bottom: PreferredSize(
//           child: Container(
//             color: kGrey02Color,
//             height: 1,
//           ),
//           preferredSize: Size.fromHeight(1),
//         ),
//         shadowColor: Colors.transparent,
//         toolbarHeight: 80,
//       ),
//       body: Container(
//         padding: EdgeInsets.fromLTRB(24, 32, 24, 16),
//         child: ListView(children: [
//           Review(),
//           Divider(
//             height: 1,
//             color: kGrey02Color,
//           ),
//           Review(),
//           Divider(
//             height: 1,
//             color: kGrey02Color,
//           ),
//           Review(),
//           Divider(
//             height: 1,
//             color: kGrey02Color,
//           ),
//           Review(),
//           Divider(
//             height: 1,
//             color: kGrey02Color,
//           ),
//           Review(),
//           Divider(
//             height: 1,
//             color: kGrey02Color,
//           ),
//           Review(),
//           Divider(
//             height: 1,
//             color: kGrey02Color,
//           ),
//         ]),
//       ),
//     );
//   }
// }

// class Review extends StatelessWidget {
//   const Review({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, OpponentReviewDetailScreen.routeName);
//       },
//       child: Container(
//         padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 90,
//               height: 90,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: new DecorationImage(
//                       image: AssetImage("assets/images/user_thumbnail.png"),
//                       fit: BoxFit.fill),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         blurRadius: 2,
//                         spreadRadius: 2,
//                         offset: Offset(2, 2))
//                   ]),
//             ),
//             SizedBox(width: 24),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(children: [
//                   RatingBar.builder(
//                     onRatingUpdate: (rating) {
//                       print(rating);
//                     },
//                     initialRating: 3,
//                     direction: Axis.horizontal,
//                     itemCount: 5,
//                     itemSize: 20,
//                     itemBuilder: (context, _) => Icon(
//                       Icons.star,
//                       color: kPrimaryColor,
//                     ),
//                     unratedColor: kGrey02Color,
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   SizedBox(
//                     child: Text(
//                       "userID",
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ]),
//                 SizedBox(height: 6),
//                 Container(
//                   child: Text(
//                     "REVIEW",
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Text(
//                   "2021.05.23~2021.05.24",
//                   style: TextStyle(fontSize: 10, color: kPrimaryColor),
//                   textAlign: TextAlign.right,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
