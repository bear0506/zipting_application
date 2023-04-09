import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/main/main_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/ui/home/home_ui.dart';
import 'package:zipting/app/ui/message/MessageScreen.dart';
import 'package:zipting/app/ui/mypage/mypage_ui.dart';
import 'package:zipting/app/ui/search/search_ui.dart';

class MainUi extends GetView<MainController> {
  const MainUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: IndexedStack(
              index: controller.bottomNavigationIndex.value,
              children: const [
                HomeUi(),
                SearchUi(),
                MessageScreen(),
                MyPageUi(),
                // controller.bottomNavigationIndex.value == 1
                //     ? const SearchUi()
                //     : const SizedBox.shrink(),
                // controller.bottomNavigationIndex.value == 2
                //     ? const MessageScreen()
                //     : const SizedBox.shrink(),
                // controller.bottomNavigationIndex.value == 3
                //     ? const MyPageUi()
                //     : const SizedBox.shrink(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.bottomNavigationIndex.value,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                label: "홈",
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                  size: 36,
                ),
                activeIcon: Icon(
                  Icons.home_outlined,
                  color: kPrimaryColor,
                  size: 36,
                ),
              ),
              BottomNavigationBarItem(
                label: '검색',
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.grey,
                  size: 36,
                ),
                activeIcon: Icon(
                  Icons.search_outlined,
                  color: kPrimaryColor,
                  size: 36,
                ),
              ),
              BottomNavigationBarItem(
                label: '채팅',
                icon: Icon(
                  Icons.bubble_chart_outlined,
                  color: Colors.grey,
                  size: 36,
                ),
                activeIcon: Icon(
                  Icons.bubble_chart_outlined,
                  color: kPrimaryColor,
                  size: 36,
                ),
              ),
              BottomNavigationBarItem(
                label: '더보기',
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.grey,
                  size: 36,
                ),
                activeIcon: Icon(
                  Icons.more_horiz_outlined,
                  color: kPrimaryColor,
                  size: 36,
                ),
              ),
              // BottomNavigationBarItem(
              //   label: "홈",
              //   icon: SizedBox(
              //     width: 25,
              //     height: 25,
              //     child: Image.asset(
              //       'assets/icons/home.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   activeIcon: SizedBox(
              //     width: 30,
              //     height: 30,
              //     child: Image.asset(
              //       'assets/icons/home_pink.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // BottomNavigationBarItem(
              //   label: '채팅',
              //   icon: SizedBox(
              //     width: 25,
              //     height: 25,
              //     child: Image.asset(
              //       'assets/icons/message.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   activeIcon: SizedBox(
              //     width: 30,
              //     height: 30,
              //     child: Image.asset(
              //       'assets/icons/message_pink.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // BottomNavigationBarItem(
              //   label: '검색',
              //   icon: SizedBox(
              //     width: 25,
              //     height: 25,
              //     child: Image.asset(
              //       'assets/icons/search-bottom.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   activeIcon: SizedBox(
              //     width: 30,
              //     height: 30,
              //     child: Image.asset(
              //       'assets/icons/search_pink.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              // BottomNavigationBarItem(
              //   label: '마이페이지',
              //   icon: SizedBox(
              //     width: 25,
              //     height: 25,
              //     child: Image.asset(
              //       'assets/icons/my.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              //   activeIcon: SizedBox(
              //     width: 30,
              //     height: 30,
              //     child: Image.asset(
              //       'assets/icons/my_pink.png',
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
            ],
            onTap: (value) => controller.bottomNavigationIndex.value = value,
          ),
        ),
      );
}
