import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/splash/splash_controller.dart';

class SplashUi extends GetView<SplashController> {
  const SplashUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEB677E),
                    Color(0xFFFF93A6),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: Image.asset(controller.image.value),
              ),
            ),
          ],
        ),
      );
}
