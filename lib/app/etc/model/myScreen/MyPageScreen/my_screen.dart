// import 'package:flutter/material.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/ProfileEditior/profile_editor.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/corona_certificate.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/cs.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/event.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/notice.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/private.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/setting.dart';
// import 'package:zipting/app/ui/home/model/myScreen/AddScreen/version_impo.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/changed_state.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/keep_list.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/profile.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/recent_see.dart';

// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "마이페이지",
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           actions: [
//             PopupMenuButton<int>(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32.0))),
//                 icon: Icon(
//                   Icons.more_vert,
//                   color: Colors.black,
//                 ),
//                 onSelected: (result) {
//                   if (result == 0) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => NoticeScreen()));
//                   } else if (result == 1) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => PrivateScreen()));
//                   } else if (result == 2) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ProfileEditorScreen()));
//                   } else if (result == 3) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => CoronaCertificateScreen()));
//                   } else if (result == 4) {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => EventScreen()));
//                   } else if (result == 5) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SettingScreen()));
//                   } else if (result == 6) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => NoticeScreen()));
//                   } else if (result == 7) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => VersionImpormation()));
//                   } else if (result == 8) {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => CsScreen()));
//                   }
//                 },
//                 itemBuilder: (context) => [
//                       PopupMenuItem<int>(
//                         value: 0,
//                         child: Text("공지사항",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             )),
//                       ),
//                       PopupMenuItem<int>(
//                           value: 1,
//                           child: Text("개인 / 보안",
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                       PopupMenuItem<int>(
//                           value: 2,
//                           child: Text("프로필 편집",
//                               style: TextStyle(color: Colors.red))),
//                       PopupMenuItem<int>(
//                           value: 3,
//                           child: Text(
//                             "예방접종 인증서 업로드",
//                             style: TextStyle(color: Colors.blue),
//                           )),
//                       PopupMenuItem<int>(
//                           value: 4,
//                           child: Text("이벤트",
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                       PopupMenuItem<int>(
//                           value: 5,
//                           child: Text("설정",
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                       PopupMenuItem<int>(
//                           value: 6,
//                           child: Text("기타",
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                       PopupMenuItem<int>(
//                           value: 7,
//                           child: Text("버전 정보",
//                               style: TextStyle(fontWeight: FontWeight.bold))),
//                       PopupMenuItem<int>(
//                           value: 8,
//                           child: Text(
//                             "고객센터/도움말",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           )),
//                     ])
//           ],
//           title: Text("마이페이지",
//               style: TextStyle(color: Colors.black, fontSize: 25)),
//           backgroundColor: Colors.white,
//           toolbarHeight: 80,
//         ),
//         body: Column(children: [
//           MyProfile(),
//           Divider(
//             thickness: 2,
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 ChangedState(),
//                 KeepList(),
//                 RecentSeeList(),
//                 ChangeStateExchange(),
//                 NowNotChangeHome()
//               ],
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
