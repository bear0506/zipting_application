import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:zipting/app/binding/splash/splash_binding.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/ui/splash/splash_ui.dart';

import 'app/routes/pages.dart';

// ignore: constant_identifier_names
const SERVER_IP = 'https://zipting.com/api/v1';
Logger logger = Logger();

void main() async {
  // URL "#" 없애주는 함수
  // setPathUrlStrategy();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'zipting',
        home: const SplashUi(),
        initialRoute: "/",
        initialBinding: SplashBinding(),
        getPages: Pages.routes,
        smartManagement: SmartManagement.full,
        builder: (context, child) => MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko', 'KR'),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(centerTitle: true),
          brightness: Brightness.light,
          primarySwatch: createMaterialColor(const Color(0xFFEB677E)),
          primaryColor: kPrimaryColor,
          unselectedWidgetColor: kGrey02Color,
          backgroundColor: Colors.white,
        ),
      );
}

// primary swatch 커스텀을 위한 메서드
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
