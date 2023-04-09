// import 'package:flutter/material.dart';
// import 'package:zipting/app/core/values/colors.dart';
// import 'package:zipting/app/ui/home/model/myScreen/MyPageScreen/myhome_tag_add.dart';

// class MyhomeAdd extends StatefulWidget {
//   const MyhomeAdd({Key? key}) : super(key: key);

//   @override
//   _MyhomeAddState createState() => _MyhomeAddState();
// }

// enum Exchange { EACH, SOLO }

// class _MyhomeAddState extends State<MyhomeAdd> {
//   bool? plusCheckButton = false;

//   int _counter = 0;
//   var _isChecked = false;
//   Exchange _exchange = Exchange.EACH;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             resizeToAvoidBottomInset: false,
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
//                 "내 집 추가",
//                 style: TextStyle(color: kTextBodyColor),
//               ),
//             ),
//             body: Container(
//               padding: EdgeInsets.all(20),
//               child: ListView(children: [
//                 Text("집이름",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 15,
//                 ),
//                 TextField(
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "미리보기에 보일 집 이름을 입력해주세요.")),
//                 Container(
//                   height: 2,
//                   color: kPrimaryColor,
//                 ),
//                 Container(
//                   height: 30,
//                 ),
//                 Text("주소",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 15,
//                 ),
//                 Row(children: [
//                   Expanded(
//                       flex: 4,
//                       child: TextField(
//                         decoration: InputDecoration(
//                             border: InputBorder.none, hintText: "주소를 입력해주세요."),
//                       )),
//                   SizedBox(
//                     width: 2,
//                   ),
//                   Expanded(
//                       child: SizedBox(
//                     height: 30,
//                     child: TextButton(
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(kPrimaryColor),
//                           shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25)))),
//                       onPressed: () {},
//                       child: Text(
//                         "주소찾기",
//                         style: TextStyle(color: Colors.white, fontSize: 10),
//                       ),
//                     ),
//                   ))
//                 ]),
//                 Container(
//                   height: 2,
//                   color: kPrimaryColor,
//                 ),
//                 Container(
//                   height: 15,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: InputBorder.none, hintText: "상세 주소를 입력해주세요."),
//                 ),
//                 Container(
//                   height: 2,
//                   color: kPrimaryColor,
//                 ),
//                 Container(
//                   height: 30,
//                 ),
//                 Text("집 인증 하기",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 30,
//                 ),
//                 Center(
//                     child: SizedBox(
//                   width: 140,
//                   height: 40,
//                   child: TextButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(kPrimaryColor),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)))),
//                     onPressed: () {
//                       //주소찾기
//                     },
//                     child: Text(
//                       "인증하기",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                 )),
//                 Container(height: 30),
//                 Row(children: [
//                   Text("교환 형태",
//                       style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                   Container(width: 10),
//                   Text("(복수 선택 가능)")
//                 ]),
//                 Container(height: 20),
//                 RadioListTile(
//                     title: Row(children: [
//                       Text("상호교환", style: TextStyle(fontSize: 17)),
//                       Container(width: 10),
//                       Text("(집을 서로 교환하고 싶어요.)", style: TextStyle(fontSize: 12))
//                     ]),
//                     activeColor: kPrimaryColor,
//                     value: Exchange.EACH,
//                     groupValue: _exchange,
//                     onChanged: (value) {
//                       setState(() {
//                         _exchange = Exchange.EACH;
//                       });
//                     }),
//                 RadioListTile(
//                     title: Row(children: [
//                       Text("단일 교환", style: TextStyle(fontSize: 17)),
//                       Container(width: 10),
//                       Text("(게스트만 받을래요.)", style: TextStyle(fontSize: 12))
//                     ]),
//                     activeColor: kPrimaryColor,
//                     value: Exchange.SOLO,
//                     groupValue: _exchange,
//                     onChanged: (value) {
//                       setState(() {
//                         _exchange = Exchange.SOLO;
//                         // _exchange = value;
//                       });
//                     }),
//                 Container(
//                   height: 30,
//                 ),
//                 Row(children: [
//                   Text("집 사진",
//                       style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                   SizedBox(width: 3),
//                   Text("(전체적인 모습이 잘 보이는 사진을 추가해주세요. 최소5장)",
//                       style: TextStyle(color: Colors.grey, fontSize: 10)),
//                 ]),
//                 SizedBox(height: 30),
//                 Container(
//                     height: 150,
//                     child:
//                         ListView(scrollDirection: Axis.horizontal, children: [
//                       SizedBox(width: 10),
//                       ButtonTheme(
//                           minWidth: 150,
//                           child: RaisedButton(
//                             color: Colors.grey[200], // background
//                             textColor: Colors.grey[400], // foreground
//                             onPressed: () {
//                               //first home add
//                               showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) =>
//                                       AlertDialog(
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(15.0)),
//                                           content: SizedBox(
//                                             height: 110,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       TextButton(
//                                                           onPressed: () {
//                                                             //Camera
//                                                           },
//                                                           child: Image.asset(
//                                                               'assets/icons/mypage/camera.png')),
//                                                       Text("촬영")
//                                                     ]),
//                                                 SizedBox(
//                                                     width: 50), //between space

//                                                 Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       TextButton(
//                                                           onPressed: () {
//                                                             //Album
//                                                           },
//                                                           child: Image.asset(
//                                                               'assets/icons/mypage/picture.png')),
//                                                       Text("앨범")
//                                                     ])
//                                               ],
//                                             ),
//                                           )));
//                             },
//                             child: Icon(Icons.add, size: 45),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                           )),
//                       SizedBox(width: 30),
//                       ButtonTheme(
//                           minWidth: 150,
//                           child: RaisedButton(
//                             color: Colors.grey[200], // background
//                             textColor: Colors.grey[400], // foreground
//                             onPressed: () {},
//                             child: Icon(Icons.add, size: 45),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                           )),
//                       SizedBox(width: 30),
//                       ButtonTheme(
//                           minWidth: 150,
//                           child: RaisedButton(
//                             color: Colors.grey[200], // background
//                             textColor: Colors.grey[400], // foreground
//                             onPressed: () {},
//                             child: Icon(Icons.add, size: 45),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                           )),
//                       SizedBox(width: 30),
//                       ButtonTheme(
//                           minWidth: 150,
//                           child: RaisedButton(
//                             color: Colors.grey[200], // background
//                             textColor: Colors.grey[400], // foreground
//                             onPressed: () {},
//                             child: Icon(Icons.add, size: 45),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15)),
//                           )),
//                     ])),
//                 Container(
//                   height: 30,
//                 ),
//                 Text("집 옵션",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 30,
//                 ),
//                 Center(
//                     child: SizedBox(
//                   width: 140,
//                   height: 40,
//                   child: TextButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(kPrimaryColor),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)))),
//                     onPressed: () {
//                       //주소찾기
//                     },
//                     child: Text(
//                       "설정하기",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                 )), //집 옵션
//                 Container(
//                   height: 30,
//                 ),
//                 Text("집 설명",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 15,
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
//                   padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: kPrimaryColor),
//                       borderRadius: BorderRadius.circular(10)),
//                   height: 200,
//                   child: Center(
//                     child: TextField(
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "집에 대해 더 말씀 해주실게 있나요?")),
//                   ),
//                 ),
//                 Container(
//                   height: 30,
//                 ),
//                 Text("태그 추가",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 30,
//                 ),
//                 Center(
//                     child: SizedBox(
//                   width: 140,
//                   height: 40,
//                   child: TextButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(kPrimaryColor),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)))),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => TagAddScreen()));
//                     },
//                     child: Text(
//                       "추가하기",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                 )), //기간 설정

//                 Container(
//                   height: 30,
//                 ),
//                 Text("기간 설정",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 30,
//                 ),
//                 Center(
//                     child: SizedBox(
//                   width: 140,
//                   height: 40,
//                   child: TextButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(kPrimaryColor),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)))),
//                     onPressed: () {},
//                     child: Text(
//                       "설정하기",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                 )),
//                 Container(
//                   height: 50,
//                 ),
//                 Text("약관 동의",
//                     style: TextStyle(color: kTextBodyColor, fontSize: 25)),
//                 Container(
//                   height: 5,
//                 ),
//                 Container(height: 2, color: kPrimaryColor),
//                 Column(children: [
//                   ListView(
//                     padding: EdgeInsets.symmetric(horizontal: 1),
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     children: [
//                       ExpansionTile(
//                         title: Flexible(
//                           child: Row(children: [
//                             Transform.scale(
//                               scale: 1,
//                               child: Checkbox(
//                                   fillColor:
//                                       MaterialStateProperty.all(kPrimaryColor),
//                                   value: plusCheckButton,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       plusCheckButton = value;
//                                     });
//                                   }),
//                             ),
//                             Text("[필수]",
//                                 style: TextStyle(
//                                     color: Colors.redAccent, fontSize: 12)),
//                             SizedBox(width: 5),
//                             Text('주소 및 거주지 정보 이용약관 동의',
//                                 style: TextStyle(fontSize: 12)),
//                           ]),
//                         ),
//                         children: [
//                           Text(
//                               "이용약관입니다5125werqqwrfasfbhuasbfuaksdbfukasdybfyukasbfuyasdfbfukyas") //이용약관
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 80)
//                 ]),
//                 Center(
//                     child: SizedBox(
//                   width: 140,
//                   height: 40,
//                   child: TextButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(kPrimaryColor),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25)))),
//                     onPressed: () {
//                       // 집 추가 Button
//                     },
//                     child: Text(
//                       "집 추가",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                   ),
//                 )),
//                 SizedBox(height: 30)
//               ]),
//             )));
//   }
// }
