// import 'package:flutter/material.dart';
// import 'package:zipting/app/widgets/keep_card.dart';
// import '../opponent_house_screen.dart';

// class Rooms extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
//       child: Column(children: [
//         InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, OpponentHouseScreen.routeName);
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'SolarDragon님의 집',
//                 style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon:
//                       Image.asset('assets/icons/chevron-right.png', width: 14))
//             ],
//           ),
//         ),
//         RoomsList(),
//       ]),
//     );
//   }
// }

// class RoomsList extends StatefulWidget {
//   @override
//   _RoomsListState createState() => _RoomsListState();
// }

// class _RoomsListState extends State<RoomsList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 20),
//       height: 250,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           KeepCard(
//               housename: '옥빛마을 17단지 아파트',
//               cityname: '경기도',
//               point: 270,
//               image: 'assets/images/signin.png'),
//           KeepCard(
//               housename: '옥빛마을 17단지 아파트',
//               cityname: '경기도',
//               point: 270,
//               image: 'assets/images/signin.png'),
//           KeepCard(
//               housename: '옥빛마을 17단지 아파트',
//               cityname: '경기도',
//               point: 270,
//               image: 'assets/images/signin.png'),
//           KeepCard(
//               housename: '옥빛마을 17단지 아파트',
//               cityname: '경기도',
//               point: 270,
//               image: 'assets/images/signin.png'),
//         ],
//       ),
//     );
//   }
// }
