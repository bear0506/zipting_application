import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/house/house_trade_success_controller.dart';
import 'package:zipting/app/core/values/colors.dart';

class HouseTradeSuccessUi extends GetView<HouseTradeSuccessController> {
  const HouseTradeSuccessUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                height: Get.height - 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            child: const Icon(
                              Icons.check_rounded,
                              color: kPrimaryColor,
                              size: 120,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const TitleWidget(),
                    const ContentWidget(),
                  ],
                ),
              ),
              const OutlinedButtonWidget(),
            ],
          ),
        ),
      );
}

class TitleWidget extends GetView<HouseTradeSuccessController> {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Text(
              controller.title.value ?? "제목",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
}

class ContentWidget extends GetView<HouseTradeSuccessController> {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                controller.content.value ?? "내용",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ],
      );
}

class OutlinedButtonWidget extends GetView<HouseTradeSuccessController> {
  const OutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: Get.width,
              height: 50,
              child: OutlinedButton(
                child: const Text(
                  "확인",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Get.offAllNamed("/main"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kPrimaryColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 1.1,
                  shadowColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                child: const Text(
                  "메세지 함으로",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Get.offAllNamed("/main"),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: kPrimaryColor, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  elevation: 1.1,
                  shadowColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
}
