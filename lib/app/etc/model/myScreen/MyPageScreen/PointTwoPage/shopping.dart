import 'package:flutter/material.dart';
import 'package:scroll_navigation/scroll_navigation.dart';
import 'package:zipting/app/core/values/colors.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: kTextBodyColor,
              size: 40,
            )),
        title: Text(
          "포인트 구매 ",
          style: TextStyle(color: kTextBodyColor),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Image.asset("assets/icons/search.png", color: Colors.black),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: TitleScrollNavigation(
            bodyStyle: NavigationBodyStyle(
                background: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            barStyle: TitleNavigationBarStyle(
                style: TextStyle(fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                spaceBetween: 40),
            titles: ["전체", "카페", "생활", "음식", "편의점", "의류", "기타"],
            pages: [
              ListView(children: [
                SellCard(
                    sellTitle: "아이스 아메리카노 Tall",
                    sellPoint: 4100,
                    shopTitle: "스타벅스",
                    sellImage: "assets/icons/mypage/starbucks.png"),
                SellCard(
                    sellTitle: "불고기 버거 세트",
                    sellPoint: 4000,
                    shopTitle: "맥도날드",
                    sellImage: "assets/images/p2.jpeg"),
                SellCard(
                    sellTitle: "스트로베리초콜릿생크림케이크",
                    sellPoint: 26000,
                    shopTitle: "투썸플레이스",
                    sellImage: "assets/images/p3.jpeg"),
                SellCard(
                    sellTitle: "기능성 티셔츠",
                    sellPoint: 59000,
                    shopTitle: "아디다스",
                    sellImage: "assets/images/p4.jpeg"),
                SellCard(
                    sellTitle: "코카콜라)제로",
                    sellPoint: 900,
                    shopTitle: "GS25",
                    sellImage: "assets/images/p5.jpeg"),
                SellCard(
                    sellTitle: "2인 패키지",
                    sellPoint: 15900,
                    shopTitle: "CGV",
                    sellImage: "assets/images/p6.jpeg"),
              ]),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.pink,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.green,
              )
            ],
            showIdentifier: false,
          ))
        ],
      ),
    ));
  }
}

class SellCard extends StatefulWidget {
  final String? sellTitle;
  final int? sellPoint;
  final String? sellImage;
  final String? shopTitle;

  const SellCard(
      {Key? key,
      this.sellTitle,
      this.sellImage,
      this.sellPoint,
      this.shopTitle})
      : super(key: key);

  @override
  _SellCardState createState() => _SellCardState();
}

class _SellCardState extends State<SellCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
          child: Column(children: [
            Row(children: [
              SizedBox(width: 15),
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('${widget.sellImage}',
                        width: 120, height: 120, fit: BoxFit.fill)),
              ),
              Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(height: 20),
                Text("${widget.sellTitle}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("${widget.sellPoint}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor)),
                    Text("포인트",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor)),
                  ],
                ),
                SizedBox(height: 50),
                Text("${widget.shopTitle}",
                    style: TextStyle(fontSize: 18, color: kTextBodyColor)),
              ]),
              SizedBox(width: 15),
            ]),
            SizedBox(height: 15),
            Divider(thickness: 2)
          ]),
          width: 380,
          height: 200,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AboutSellPage()));
        });
  }
}

class AboutSellPage extends StatefulWidget {
  const AboutSellPage({Key? key}) : super(key: key);

  @override
  _AboutSellPageState createState() => _AboutSellPageState();
}

class _AboutSellPageState extends State<AboutSellPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = [
    Tab(
      text: "상품설명",
    ),
    Tab(text: "후기"),
    Tab(text: "상세정보")
  ];
  int selectedIndex = 0;

  TabController? _tabController;
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {
      _tabController =
          TabController(initialIndex: selectedIndex, length: 3, vsync: this);
      _tabController!.addListener(_handleTabSelection);
    });
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

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
          "포인트 구매 ",
          style: TextStyle(color: kTextBodyColor),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Image.asset("assets/icons/search.png", color: Colors.black),
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 30),
        Container(
          height: 430,
          child: Column(children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset('assets/icons/mypage/starbucks.png',
                      width: 270, height: 270, fit: BoxFit.fill)),
            ),
            Container(
                width: 380,
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("아이스 카페 아메리카노 Tall", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      Text("4100 포인트",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold))
                    ])),
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 30,
                child: Row(children: [
                  Text("스타벅스", style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/chevron-right.png',
                        width: 15, height: 15),
                  )
                ])),
            Divider()
          ]),
        ),
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: kPrimaryColor,
          tabs: myTabs,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        Visibility(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("스타벅스의 깔끔한 맛을 자랑하는 커피로, 스타벅스 파트너들이 가장 좋아하는 커피입니다."),
              SizedBox(height: 25),
              Center(
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/icons/mypage/aboutSell.jpeg',
                          width: 300, height: 450, fit: BoxFit.fill)),
                ),
              ),
              SizedBox(height: 25),
              Text("이용안내", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 25),
              Text(
                  "-차가운 물로 14시간 동안 서서히 완성된 콜드 브루가 질소와 만나 나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마를 탄생시켰습니다. 부드러운 목넘김과 완벽한 밸런스에 커피 본연의 단맛을 경험할 수 있습니다. 격조 있는 커피가 어울리는 당신께 스타벅스가 지금, 제안합니다."),
            ]),
          ),
          visible: selectedIndex == 0,
        ),
        Visibility(
          child: Center(
            child: Column(children: [
              Container(
                height: 350,
                color: Colors.green,
              )
            ]),
          ),
          visible: selectedIndex == 1,
        ),
        Visibility(
          child: Center(
            child: Column(children: [
              Container(
                height: 350,
                color: Colors.grey,
              )
            ]),
          ),
          visible: selectedIndex == 2,
        ),
        SizedBox(height: 20),
        Center(
            child: SizedBox(
          width: 140,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          buttonPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          title: SizedBox(
                              height: 150,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(children: [
                                      Text("보유 포인트",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Spacer(),
                                      Text("4,861",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 5),
                                      Text("포인트",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    Row(children: [
                                      Text("차감 포인트",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Spacer(),
                                      Text("4,100",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                      SizedBox(width: 5),
                                      Text("포인트",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor))
                                    ]),
                                    Divider(thickness: 2),
                                    Row(children: [
                                      Text("구매 후 잔여 포인트",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Spacer(),
                                      Text("761",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(width: 5),
                                      Text("포인트",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ]),
                                    TextButton(
                                        onPressed: () {
                                          //전자상 거래 규정
                                        },
                                        child: Text("전자상 거래 규정 보기",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)))
                                  ])),
                          actions: [
                            Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: TextButton(
                                  onPressed: () {
                                    //기프티콘 발급란
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                buttonPadding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                title: SizedBox(
                                                    height: 150,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Row(children: [
                                                            Text("상품을 구입하셨습니다.",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            SizedBox(),
                                                          ]),
                                                          Image.asset(
                                                              'assets/images/pwdcheck_ok.png'),
                                                          Text(
                                                              "기프티콘을 이미지 파일로 저장하였습니다.",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))
                                                        ])),
                                                actions: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: kPrimaryColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "확인",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )),
                                                  )
                                                ]));
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "기프티콘 발급",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            )
                          ]));
            },
            child: Text(
              "구매하기",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        )),
        SizedBox(height: 20),
      ]),
    ));
  }
}
