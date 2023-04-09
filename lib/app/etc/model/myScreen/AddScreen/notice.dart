import 'package:flutter/material.dart';
import 'package:zipting/app/core/values/colors.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
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
            "공지사항",
            style: TextStyle(color: kTextBodyColor),
          )),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Notice(
                  noticeDay: "21/05/11",
                  noticeTitle: "무-야호~! 그만큼 기대가 되신다는 거지 9.3.2 업데이트 안내",
                  noticeSemiTitle: "한 눈에 보기 편해진 트렌드",
                  noticeBody:
                      "남들은 어떻게 휴가를 즐기는지 \n남들은 어디로 여행을 가는지 이제 궁금해 하지 마세요! \n검색 기능에 검색어 순위 기능 업데이트! \n보다 쉽게 이번 시즌 인기 검색어를 확인 할 수 있답니다!"),
              Notice(
                  noticeDay: "21/05/05",
                  noticeTitle: " 신나는 어린이날 가족과 함께 여행 떠나기 좋은날 9.3.2 업데이트 안내",
                  noticeSemiTitle: "오래된 노래",
                  noticeBody:
                      "앨범 오래된 노래 발매 2012.09.04 장르 얼터너티브/인디 타이틀 오래된 노래 발매사 카카오뮤직 기획사 BORN 앨범 소개 대한민국의 인디 그룹 스탠딩 에그 의 싱글 곡이다. 2020년 임영웅 이 애창곡으로 여러 번 부르면서 역주행 해 8월 30일 기준 멜론 일간 24Hits 순위에서 20위까지 올라갔다. # 이후 멜론 2020년 10월 13일에 실시간 차트 최대 6위까지 올라갔다. "),
              Notice(
                  noticeDay: "21/05/05",
                  noticeTitle:
                      " 아니 이게 머선일이고! 드디어 태블릿 에서도 사용 가능하다고 ? 집팅 9.3.4 업데이트 안내",
                  noticeSemiTitle: "팅팅탱탱 후라이팬 놀이 오징어 게임",
                  noticeBody:
                      "프론트맨으로 대표되는 주최 측이 게임에서 가장 중요하게 생각하는 건 '평등'으로, 게임의 규칙만 지켰다면 어느 정도 꼼수를 써도 게임에서 승리한 것으로 처리해주지만 규칙을 어겼을 경우 그게 참가자든 주최 측 인원이든 가차없이 처벌한다. 그래서 최종 우승자에게도 아무 문제 없이 우승 상금을 한 푼도 빠짐없이 다 챙겨줬고, 추후 위해를 가하지도 않았다.")
            ],
          ))
        ],
      ),
    ));
  }
}

class Notice extends StatefulWidget {
  final String? noticeDay;
  final String? noticeTitle;
  final String? noticeSemiTitle;
  final String? noticeBody;
  const Notice(
      {Key? key,
      this.noticeDay,
      this.noticeTitle,
      this.noticeSemiTitle,
      this.noticeBody})
      : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ListView(
        padding: EdgeInsets.only(top: 20),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ExpansionTile(
              title: Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text("${widget.noticeDay}",
                          style: TextStyle(color: kTextBodyColor)),
                      SizedBox(height: 5),
                      Text('${widget.noticeTitle}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ]),
              ),
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text("#${widget.noticeSemiTitle} ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          Text("${widget.noticeBody}"),
                          SizedBox(height: 15),
                        ]))
              ]),
        ],
      ),
      SizedBox(height: 10),
      Divider(
        thickness: 2,
      )
    ]));
  }
}
