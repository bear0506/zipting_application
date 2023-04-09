// import 'package:flutter/material.dart';
// import 'package:zipting/app/core/values/colors.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/PointTwoPage/charge.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/PointTwoPage/shopping.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/coupon.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/myhome_management.dart';

// class MyProfile extends StatefulWidget {
//   @override
//   _MyProfileState createState() => _MyProfileState();
// }

// class _MyProfileState extends State<MyProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: NetworkImage(
//                         'https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2019/12/PS19120300014.jpg'),
//                     fit: BoxFit.fill),
//               ),
//             ),
//             Spacer(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(height: 20),
//                 Text("아이린", style: TextStyle(fontSize: 19)),
//                 Spacer(),
//                 Row(children: [
//                   Text("[007Yang]", style: TextStyle(fontSize: 15)),
//                   SizedBox(
//                     width: 40,
//                     height: 30,
//                     child: TextButton(
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) => AlertDialog(
//                                       buttonPadding: EdgeInsets.zero,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(15.0)),
//                                       title: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "닉네임 변경",
//                                             style: TextStyle(fontSize: 23),
//                                           ),
//                                           Divider(
//                                             thickness: 2,
//                                           )
//                                         ],
//                                       ),
//                                       content: Container(
//                                         width: double.infinity,
//                                         height: 120,
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   flex: 4,
//                                                   child: TextField(
//                                                     decoration: InputDecoration(
//                                                         border:
//                                                             InputBorder.none,
//                                                         hintText:
//                                                             "닉네임을 입력해주세요."),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 2,
//                                                 ),
//                                                 Expanded(
//                                                     child: SizedBox(
//                                                   height: 30,
//                                                   child: TextButton(
//                                                     style: ButtonStyle(
//                                                         backgroundColor:
//                                                             MaterialStateProperty
//                                                                 .all(
//                                                                     kPrimaryColor),
//                                                         shape: MaterialStateProperty.all(
//                                                             RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             25)))),
//                                                     onPressed: () {
//                                                       showDialog(
//                                                           context: context,
//                                                           builder: (BuildContext
//                                                                   context) =>
//                                                               AlertDialog(
//                                                                   buttonPadding:
//                                                                       EdgeInsets
//                                                                           .zero,
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               15.0)),
//                                                                   title:
//                                                                       SizedBox(
//                                                                           height:
//                                                                               150,
//                                                                           child: Column(
//                                                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                                               children: [
//                                                                                 Row(
//                                                                                   children: [
//                                                                                     Text(
//                                                                                       " I LOVE ZIPTING ",
//                                                                                       style: TextStyle(fontSize: 20, color: kPrimaryColor),
//                                                                                     ),
//                                                                                     Text("은", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                                                                                   ],
//                                                                                 ),
//                                                                                 Row(children: [
//                                                                                   Text("사용 가능한 닉네임입니다.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//                                                                                   SizedBox(),
//                                                                                 ]),
//                                                                                 Image.asset('assets/images/pwdcheck_ok.png'),
//                                                                                 Text("닉네임을 마저 변경해주세요.", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
//                                                                               ])),
//                                                                   actions: [
//                                                                     Container(
//                                                                       decoration: BoxDecoration(
//                                                                           color:
//                                                                               kPrimaryColor,
//                                                                           borderRadius: BorderRadius.only(
//                                                                               bottomLeft: Radius.circular(10),
//                                                                               bottomRight: Radius.circular(10))),
//                                                                       child: TextButton(
//                                                                           onPressed: () {
//                                                                             Navigator.pop(context);
//                                                                           },
//                                                                           child: Align(
//                                                                             alignment:
//                                                                                 Alignment.center,
//                                                                             child:
//                                                                                 Text(
//                                                                               "확인",
//                                                                               style: TextStyle(color: Colors.white),
//                                                                             ),
//                                                                           )),
//                                                                     )
//                                                                   ]));
//                                                     },
//                                                     child: Text(
//                                                       "중복확인",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontSize: 10),
//                                                     ),
//                                                   ),
//                                                 )),
//                                               ],
//                                             ),
//                                             Container(
//                                               height: 2,
//                                               color: kPrimaryColor,
//                                             ),
//                                             SizedBox(
//                                               height: 22,
//                                             ),
//                                             Container(
//                                                 padding:
//                                                     EdgeInsets.only(bottom: 5),
//                                                 decoration: BoxDecoration(
//                                                     border: Border(
//                                                         bottom: BorderSide(
//                                                             color: Colors.black,
//                                                             width: 1))),
//                                                 child: Text(
//                                                     "닉네임 변경에는 1000포인트가 사용됩니다.",
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 11)))
//                                           ],
//                                         ),
//                                       ),
//                                       actions: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               color: kPrimaryColor,
//                                               borderRadius: BorderRadius.only(
//                                                   bottomLeft:
//                                                       Radius.circular(10),
//                                                   bottomRight:
//                                                       Radius.circular(10))),
//                                           child: TextButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               child: Align(
//                                                 alignment: Alignment.center,
//                                                 child: Text(
//                                                   "확인",
//                                                   style: TextStyle(
//                                                       color: Colors.white),
//                                                 ),
//                                               )),
//                                         )
//                                       ]));
//                         },
//                         child: Text("변경",
//                             style:
//                                 TextStyle(color: kPrimaryColor, fontSize: 11))),
//                   )
//                 ]),
//                 Row(children: [
//                   Text("4861", style: TextStyle(fontSize: 15)),
//                   SizedBox(
//                     width: 50,
//                     height: 33,
//                     child: TextButton(
//                         onPressed: () {
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context) => AlertDialog(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(15.0)),
//                                   content: SizedBox(
//                                     height: 110,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               TextButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 ChargePage()));
//                                                   },
//                                                   child: Image.asset(
//                                                       'assets/icons/mypage/coin.png')),
//                                               Text("충전")
//                                             ]),
//                                         SizedBox(width: 50), //between space

//                                         Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               TextButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 ShoppingScreen()));
//                                                   },
//                                                   child: Image.asset(
//                                                       'assets/icons/mypage/cart.png')),
//                                               Text("사용")
//                                             ])
//                                       ],
//                                     ),
//                                   )));
//                         },
//                         child: Text("포인트",
//                             style:
//                                 TextStyle(color: kPrimaryColor, fontSize: 12))),
//                   )
//                 ]),
//                 SizedBox(
//                   height: 35,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => CouponScreen()));
//                     },
//                     child: Row(children: [
//                       Image.asset('assets/icons/mypage/coupon.png',
//                           width: 20, height: 15),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text("쿠폰함",
//                           style: TextStyle(color: kPrimaryColor, fontSize: 12)),
//                     ]),
//                   ),
//                 )
//               ], //name,nickname,point,coupon
//             ),
//             Spacer(),
//             SizedBox(
//                 width: 145,
//                 height: 50,
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => MyhomeManagement()));
//                   },
//                   style: ButtonStyle(
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(13.0),
//                               side: BorderSide(color: kPrimaryColor)))),
//                   child: Row(
//                     children: [
//                       Image.asset('assets/icons/mypage/heart.png',
//                           width: 30, height: 50),
//                       Container(width: 10),
//                       Text("내 집 관리",
//                           style: TextStyle(
//                               color: kPrimaryColor,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//         height: 170,
//         padding: EdgeInsets.fromLTRB(10, 8, 15, 5));
//   }
// }
