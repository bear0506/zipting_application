import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/search/search_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';
import 'package:zipting/app/ui/search/hot_search.dart';
import 'package:zipting/app/ui/search/recent_search.dart';
import 'package:zipting/app/ui/search/travel_trend.dart';

class SearchUi extends GetView<SearchController> {
  const SearchUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.currentFocus = FocusScope.of(context);

        if (!controller.currentFocus.hasPrimaryFocus &&
            controller.currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SearchWidget(),
                  HotSearchRecentWidget(),
                  SearchRecentWidget(),
                  TrendRecentWidget(),
                  // Expanded(
                  //   child: ListView(
                  //     children: [RecentSearch(), HotSearch(), TravelTrend()],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends GetView<SearchController> {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                // height: 150,
                child: TextFormField(
                  // controller: controller.endedAtTextFormFieldController,
                  // focusNode: controller.endedAtTextFormFieldFocusNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  // onChanged: (value) =>
                  //     controller.globalFormKey.currentState!.save(),
                  style: const TextStyle(color: kTextBodyColor, fontSize: 20),
                  decoration: const InputDecoration(
                    // labelText: "어디로 떠나실 건가요?",
                    hintText: "어디로 떠나실 건가요?",
                    hintStyle: TextStyle(
                      color: Colors.black12,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                width: 40,
                height: 40,
                child: InkWell(
                  child: const Icon(
                    Icons.search,
                    size: 32,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
}

class HotSearchRecentWidget extends GetView<SearchController> {
  const HotSearchRecentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 20),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: const [
          //       Icon(
          //         Icons.star_border_purple500_rounded,
          //         color: kPrimaryColor,
          //         size: 26,
          //       ),
          //       SizedBox(width: 5),
          //       Text(
          //         "최근 인기 검색어를 보여드려요!",
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: kPrimaryColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "최근 인기 검색어를 보여드려요!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    Text(
                      "검색$index",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade200,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          globalDividerWidget(),
        ],
      );
}

class SearchRecentWidget extends GetView<SearchController> {
  const SearchRecentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "최근 검색어",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text(
                  "모두지우기",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  children: [
                    Text(
                      "검색$index",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.close, color: Colors.black54, size: 16),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade200,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          globalDividerWidget(),
        ],
      );
}

class TrendRecentWidget extends GetView<SearchController> {
  const TrendRecentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "이 달의 여행 트렌드",
              style: TextStyle(
                fontSize: 26,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/icons/mypage/im1.png',
                          width: 180, height: 180, fit: BoxFit.fill),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        "#서핑",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/icons/mypage/im2.png',
                          width: 180, height: 180, fit: BoxFit.fill),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        "#힐링",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/icons/mypage/im3.png',
                          width: 180, height: 180, fit: BoxFit.fill),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        "#여행",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/icons/mypage/im4.png',
                          width: 180, height: 180, fit: BoxFit.fill),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        "#자연",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      );
}
