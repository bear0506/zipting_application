import 'package:get/get.dart';

import 'package:zipting/app/binding/event/event_binding.dart';
import 'package:zipting/app/binding/find/find_binding.dart';
import 'package:zipting/app/binding/help/help_binding.dart';
import 'package:zipting/app/binding/house/house_all_binding.dart';
import 'package:zipting/app/binding/house/house_binding.dart';
import 'package:zipting/app/binding/house/house_mutual_trade_binding.dart';
import 'package:zipting/app/binding/house/house_single_trade_binding.dart';
import 'package:zipting/app/binding/house/house_trade_success_binding.dart';
import 'package:zipting/app/binding/main/main_binding.dart';
import 'package:zipting/app/binding/management/management_house_binding.dart';
import 'package:zipting/app/binding/management/management_house_create_binding.dart';
import 'package:zipting/app/binding/management/management_house_update_binding.dart';
import 'package:zipting/app/binding/more/more_password_update_binding.dart';
import 'package:zipting/app/binding/more/more_privacy_update_binding.dart';
import 'package:zipting/app/binding/more/more_profile_update_binding.dart';
import 'package:zipting/app/binding/mypage/mypage_binding.dart';
import 'package:zipting/app/binding/mypage/mypage_search_recent_all_binding.dart';
import 'package:zipting/app/binding/mypage/mypage_trade_all_binding.dart';
import 'package:zipting/app/binding/mypage/mypage_trade_history_binding.dart';
import 'package:zipting/app/binding/mypage/mypage_wishlist_all_binding.dart';
import 'package:zipting/app/binding/notice/notice_binding.dart';
import 'package:zipting/app/binding/qna/qna_binding.dart';
import 'package:zipting/app/binding/review/review_all_binding.dart';
import 'package:zipting/app/binding/search/search_binding.dart';
import 'package:zipting/app/binding/signin/signin_binding.dart';
import 'package:zipting/app/binding/signup/signup_binding.dart';
import 'package:zipting/app/binding/splash/splash_binding.dart';
import 'package:zipting/app/binding/success/success_binding.dart';
import 'package:zipting/app/binding/user/user_binding.dart';
import 'package:zipting/app/routes/route.dart';
import 'package:zipting/app/ui/event/event_ui.dart';
import 'package:zipting/app/ui/find/find_ui.dart';
import 'package:zipting/app/ui/help/help_ui.dart';
import 'package:zipting/app/ui/help/qna_ui.dart';
import 'package:zipting/app/ui/house/house_all_ui.dart';
import 'package:zipting/app/ui/house/house_mutual_trade_ui.dart';
import 'package:zipting/app/ui/house/house_single_trade_ui.dart';
import 'package:zipting/app/ui/house/house_trade_success_ui.dart';
import 'package:zipting/app/ui/house/house_ui.dart';
import 'package:zipting/app/ui/main/main_ui.dart';
import 'package:zipting/app/ui/mypage/management_house_create_ui.dart';
import 'package:zipting/app/ui/mypage/management_house_ui.dart';
import 'package:zipting/app/ui/mypage/management_house_update_ui.dart';
import 'package:zipting/app/ui/more/more_help_ui.dart';
import 'package:zipting/app/ui/more/more_password_update_ui.dart';
import 'package:zipting/app/ui/more/more_privacy_update_ui.dart';
import 'package:zipting/app/ui/more/more_profile_update_ui.dart';
import 'package:zipting/app/ui/more/more_ui.dart';
import 'package:zipting/app/ui/mypage/mypage_search_recent_all_ui.dart';
import 'package:zipting/app/ui/mypage/mypage_trade_all_ui.dart';
import 'package:zipting/app/ui/mypage/mypage_trade_history_ui.dart';
import 'package:zipting/app/ui/mypage/mypage_ui.dart';
import 'package:zipting/app/ui/mypage/mypage_wishlist_all_ui.dart';
import 'package:zipting/app/ui/notice/notice_ui.dart';
import 'package:zipting/app/ui/review/review_all_ui.dart';
import 'package:zipting/app/ui/search/search_ui.dart';
import 'package:zipting/app/ui/signin/signin_ui.dart';
import 'package:zipting/app/ui/signup/signup_Info_ui.dart';
import 'package:zipting/app/ui/signup/signup_password_ui.dart';
import 'package:zipting/app/ui/signup/signup_phone_ui.dart';
import 'package:zipting/app/ui/signup/signup_terms_ui.dart';
import 'package:zipting/app/ui/splash/splash_ui.dart';
import 'package:zipting/app/ui/success/success_ui.dart';
import 'package:zipting/app/ui/user/user_ui.dart';

class Pages {
  static final routes = [
    GetPage(
      title: "스플래시 화면",
      name: Routes.spalsh,
      page: () => const SplashUi(),
      binding: SplashBinding(),
    ),
    GetPage(
      title: "로그인 화면",
      name: Routes.signin,
      page: () => const SignInUi(),
      binding: SignInBinding(),
    ),
    GetPage(
      title: "개인정보처리방침 및 약관동의",
      name: Routes.signupTerms,
      page: () => const SignUpTermsUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "핸드폰 인증",
      name: Routes.signupPhone,
      page: () => SignUpPhoneUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "닉네임 및 이메일 정보 입력",
      name: Routes.signupInfo,
      page: () => SignUpInfoUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "비밀번호 설정 후 회원가입 완료",
      name: Routes.signupPassword,
      page: () => SignUpPasswordUi(),
      binding: SignUpBinding(),
    ),
    GetPage(
      title: "이메일 및 비밀번호 찾기 화면",
      name: Routes.find,
      page: () => const FindUi(),
      binding: FindBinding(),
    ),
    GetPage(
      title: "메인 화면",
      name: Routes.main,
      page: () => const MainUi(),
      binding: MainBinding(),
    ),
    GetPage(
      title: "매물 화면",
      name: Routes.house,
      page: () => const HouseUi(),
      binding: HouseBinding(),
    ),
    GetPage(
      title: "매물 -> 상호교환 화면",
      name: Routes.houseMutualTrade,
      page: () => const HouseMutualTradeUi(),
      binding: HouseMutualTradeBinding(),
    ),
    GetPage(
      title: "매물 -> 단일여행 화면",
      name: Routes.houseSingle,
      page: () => const HouseSingleTradeUi(),
      binding: HouseSingleTradeBinding(),
    ),
    GetPage(
      title: "매물 -> 교환요청 완료 화면",
      name: Routes.houseTradeSuccess,
      page: () => const HouseTradeSuccessUi(),
      binding: HouseTradeSuccessBinding(),
    ),
    GetPage(
      title: "매물 -> 후기 모두보기 화면",
      name: Routes.houseReviewAll,
      page: () => ReviewAllUi(),
      binding: ReviewAllBinding(),
    ),
    GetPage(
      title: "유저 -> 매물 모두보기 화면",
      name: Routes.houseAll,
      page: () => const HouseAllUi(),
      binding: HouseAllBinding(),
    ),
    GetPage(
      title: "유저 -> 후기 모두보기 화면",
      name: Routes.reviewAll,
      page: () => ReviewAllUi(),
      binding: ReviewAllBinding(),
    ),
    GetPage(
      title: "유저(프로필) 화면",
      name: Routes.user,
      page: () => UserUi(),
      binding: UserBinding(),
    ),
    GetPage(
      title: "메인 -> 마이페이지 화면",
      name: Routes.mypage,
      page: () => const MyPageUi(),
      binding: MyPageBinding(),
    ),
    GetPage(
      title: "메인 -> 검색페이지 화면",
      name: Routes.search,
      page: () => const SearchUi(),
      binding: SearchBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 더보기 화면",
      name: Routes.more,
      page: () => const MoreUi(),
    ),
    GetPage(
      title: "마이페이지 -> 내집관리 화면",
      name: Routes.myPageManagementHouse,
      page: () => const ManageMentHouseUi(),
      binding: ManagementHouseBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 내집관리 화면 -> 내집관리 추가",
      name: Routes.myPageManagementHouseCreate,
      page: () => const ManageMentHouseCreateUi(),
      binding: ManagementHouseCreateBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 내집관리 화면 -> 내집관리 수정",
      name: Routes.myPageManagementHouseUpdate,
      page: () => const ManageMentHouseUpdateUi(),
      binding: ManagementHouseUpdateBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 교환내역 화면",
      name: Routes.mypageTradeHistory,
      page: () => const MyPageTradeHistoryUi(),
      binding: MyPageTradeHistoryBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 진행중인 교환 요청내역 화면",
      name: Routes.mypageTradeAll,
      page: () => const MyPageTradeAllUi(),
      binding: MyPageTradeAllBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 찜 목록 더보기 화면",
      name: Routes.mypageWishListAll,
      page: () => const MyPageWishListAllUi(),
      binding: MyPageWishlistAllBinding(),
    ),
    GetPage(
      title: "마이페이지 -> 최근 조회 내역 화면",
      name: Routes.mypageSearchRecentAll,
      page: () => const MyPageSearchRecentAllUi(),
      binding: MyPageSearchRecentAllBinding(),
    ),
    GetPage(
      title: "더보기 -> 프로필 관리 화면",
      name: Routes.moreProfileUpdate,
      page: () => const MoreProfileUpdateUi(),
      binding: MoreProfileUpdateBinding(),
    ),
    GetPage(
      title: "더보기 -> 개인정보 관리 화면",
      name: Routes.morePrivacyUpdate,
      page: () => const MorePrivacyUpdateUi(),
      binding: MorePrivacyUpdateBinding(),
    ),
    GetPage(
      title: "더보기 -> 비밀번호 관리 화면",
      name: Routes.morePasswordUpdate,
      page: () => const MorePasswordUpdateUi(),
      binding: MorePasswordUpdateBinding(),
    ),
    GetPage(
      title: "더보기 -> 공지사항 화면",
      name: Routes.notice,
      page: () => NoticeUi(),
      binding: NoticeBinding(),
    ),
    GetPage(
      title: "더보기 -> 이벤트 화면",
      name: Routes.event,
      page: () => EventUi(),
      binding: EventBinding(),
    ),
    GetPage(
      title: "더보기 -> 고객센터/도움말 화면",
      name: Routes.moreHelp,
      page: () => const MoreHelpUi(),
    ),
    GetPage(
      title: "고객센터/도움말 -> 도움말 화면",
      name: Routes.help,
      page: () => HelpUi(),
      binding: HelpBinding(),
    ),
    GetPage(
      title: "고객센터/도움말 -> 자주하는 질문 화면",
      name: Routes.qna,
      page: () => QnaUi(),
      binding: QnaBinding(),
    ),
    GetPage(
      title: "완료 화면",
      name: Routes.success,
      page: () => const SuccessUi(),
      binding: SuccessBinding(),
    ),
  ];
}

// import 'package:flutter/app/widgets.dart';
// //메인
// import 'package:zipting/app/ui/main/main_screen.dart';
// //스플래쉬
// import 'package:zipting/app/ui/splash/SplashScreen.dart';
// //로그인
// import 'package:zipting/app/ui/signin/SigninScreen.dart';
// //회원가입
// import 'package:zipting/app/ui/signup/signup_screen.dart';
// //룸 디테일
// import 'package:zipting/app/ui/room_detail/room_detail_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_house_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_review_screen.dart';
// import 'package:zipting/app/ui/opponent/opponent_review_detail_screen.dart';
// import 'package:zipting/app/ui/opponent/OpponentMoreScreen.dart';

// final Map<String, WidgetBuilder> routes = {
//   SplashScreen.routeName: (context) => SplashScreen(),
//   SigninScreen.routeName: (context) => SigninScreen(),
//   SignupScreen.routeName: (context) => SignupScreen(),
//   MainScreen.routeName: (context) => MainScreen(),
//   RoomDetailScreen.routeName: (context) => RoomDetailScreen(),
//   OpponentScreen.routeName: (context) => OpponentScreen(),
//   OpponentHouseScreen.routeName: (context) => OpponentHouseScreen(),
//   OpponentReviewScreen.routeName: (context) => OpponentReviewScreen(),
//   OpponentReviewDetailScreen.routeName: (context) =>
//       OpponentReviewDetailScreen(),
//   OpponentMoreScreen.routeName: (context) => OpponentMoreScreen()
// };
