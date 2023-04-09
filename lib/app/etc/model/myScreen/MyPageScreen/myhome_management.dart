// import 'package:flutter/material.dart';
// import 'package:zipting/app/core/values/colors.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/myhome_add.dart';

// class MyhomeManagement extends StatefulWidget {
//   const MyhomeManagement({Key? key}) : super(key: key);

//   @override
//   _MyhomeManagementState createState() => _MyhomeManagementState();
// }

// class _MyhomeManagementState extends State<MyhomeManagement> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.chevron_left,
//                     color: kTextBodyColor,
//                     size: 40,
//                   )),
//               title: Text(
//                 "내 집 관리",
//                 style: TextStyle(color: kTextBodyColor),
//               ),
//             ),
//             body: Column(children: [
//               Expanded(
//                 child: ListView(
//                   children: [
//                     PlusCard(),
//                   ],
//                 ),
//               )
//             ])));
//   }
// }

// class PlusCard extends StatefulWidget {
//   const PlusCard({Key? key}) : super(key: key);

//   @override
//   _PlusCardState createState() => _PlusCardState();
// }

// class _PlusCardState extends State<PlusCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Padding(padding: EdgeInsets.only(top: 30)),
//         ButtonTheme(
//             minWidth: 360,
//             height: 120,
//             child: RaisedButton(
//               color: Colors.grey[200], // background
//               textColor: Colors.grey[400], // foreground
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => MyhomeAdd()));
//               },
//               child: Icon(Icons.add, size: 45),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0)),
//             )),
//         SizedBox(
//           height: 15,
//         ),
//         Divider(
//           thickness: 2,
//         )
//       ]),
//     );
//   }
// }
