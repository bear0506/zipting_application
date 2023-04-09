import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zipting/app/controller/management/management_house_update_controller.dart';
import 'package:zipting/app/core/values/colors.dart';
import 'package:zipting/app/global_widgets/gloabl_snackbar_widget.dart';
import 'package:zipting/app/global_widgets/global_divider_widget.dart';
import 'package:zipting/app/global_widgets/loader_widget.dart';

class ManageMentHouseUpdateUi extends GetView<ManageMentHouseUpdateController> {
  const ManageMentHouseUpdateUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.currentFocus = FocusScope.of(context);

          if (!controller.currentFocus.hasPrimaryFocus &&
              controller.currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppbarWidget(appBar: AppBar()),
              body: SafeArea(
                child: Form(
                  key: controller.globalFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    child: ListView(
                      children: const [
                        ImagesWidget(),
                        TitleWidget(),
                        ContentWidget(),
                        AddressWidget(),
                        PointWidget(),
                        HouseTypeWidget(),
                        ContractTypeWidget(),
                        RoomCountWidget(),
                        BedCountWidget(),
                        BathRoomCountWidget(),
                        AcreageWidget(),
                        StartedAtWidget(),
                        EndedAtWidget(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomSheet: const BottomSheetOutlinedButtonWidget(),
            ),
            customLoaderWidget(
                isLoaderisible: controller.isLoaderVisible.value),
          ],
        ),
      );
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key, required this.appBar}) : super(key: key);

  final AppBar appBar;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black45, size: 32),
          tooltip: "뒤로가기",
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      );
}

class ImagesWidget extends GetView<ManageMentHouseUpdateController> {
  const ImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      child: Container(
                        width: 100,
                        height: 100,
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onTap: () => controller.handleSelectImage(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: Get.width,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imageList.length,
                      itemBuilder: (BuildContext _, int index) => Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: controller.imageList[index]["type"] ==
                                        "local"
                                    ? Image.file(File(
                                        controller.imageList[index]["path"]))
                                    : Image.network(
                                        controller.imageList[index]["path"],
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            onTap: () =>
                                controller.handleImageDelete(index: index),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            globalDividerWidget(),
          ],
        ),
      );
}

class TitleWidget extends GetView<ManageMentHouseUpdateController> {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.titleTextFormFieldController,
            focusNode: controller.titleTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "title", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            validator: (value) =>
                controller.handleValidator(type: "title", value: value),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "제목",
              hintText: "제목을 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}

class ContentWidget extends GetView<ManageMentHouseUpdateController> {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.contentTextFormFieldController,
            focusNode: controller.contentTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            validator: (value) =>
                controller.handleValidator(type: "content", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "content", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "내용",
              hintText: "내용을 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}

class AddressWidget extends GetView<ManageMentHouseUpdateController> {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.addressTextFormFieldController,
            focusNode: controller.addressTextFormFieldFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(30),
            ],
            validator: (value) =>
                controller.handleValidator(type: "address", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "address", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "주소",
              hintText: "주소를 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}

class PointWidget extends GetView<ManageMentHouseUpdateController> {
  const PointWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.pointTextFormFieldController,
            focusNode: controller.pointTextFormFieldFocusNode,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(10),
            ],
            validator: (value) =>
                controller.handleValidator(type: "point", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "point", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "숙박 포인트",
              hintText: "숙박에 필요한 포인트를 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}

class HouseTypeWidget extends GetView<ManageMentHouseUpdateController> {
  const HouseTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            SizedBox(
              width: Get.width - 80,
              child: Text(
                "매물타입",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width - 80,
                  child: DropdownButton(
                    focusNode: controller.houseTypeTextFormFieldFocusNode,
                    alignment: Alignment.centerLeft,
                    isExpanded: true,
                    value: controller.houseType.value,
                    items: controller.houseTypeList
                        .map((value) => DropdownMenuItem(
                              alignment: Alignment.centerLeft,
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (Object? value) => controller.houseType(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}

class ContractTypeWidget extends GetView<ManageMentHouseUpdateController> {
  const ContractTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            SizedBox(
              width: Get.width - 80,
              child: Text(
                "계약타입",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width - 80,
                  child: DropdownButton(
                    focusNode: controller.contractTypeTextFormFieldFocusNode,
                    alignment: Alignment.centerLeft,
                    isExpanded: true,
                    value: controller.contractType.value,
                    items: controller.contractTypeList
                        .map((value) => DropdownMenuItem(
                              alignment: Alignment.centerLeft,
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (Object? value) =>
                        controller.contractType(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}

class RoomCountWidget extends GetView<ManageMentHouseUpdateController> {
  const RoomCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            SizedBox(
              width: Get.width - 80,
              child: Text(
                "방개수",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width - 80,
                  child: DropdownButton(
                    focusNode: controller.roomCountTextFormFieldFocusNode,
                    alignment: Alignment.centerLeft,
                    isExpanded: true,
                    value: controller.roomCount.value,
                    items: List.generate(
                      5,
                      (index) => DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: (index + 1).toString(),
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    onChanged: (Object? value) => controller.roomCount(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}

class BedCountWidget extends GetView<ManageMentHouseUpdateController> {
  const BedCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            SizedBox(
              width: Get.width - 80,
              child: Text(
                "침대개수",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width - 80,
                  child: DropdownButton(
                    focusNode: controller.bedCountTextFormFieldFocusNode,
                    alignment: Alignment.centerLeft,
                    isExpanded: true,
                    value: controller.bedCount.value,
                    items: List.generate(
                      5,
                      (index) => DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: (index + 1).toString(),
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    onChanged: (Object? value) => controller.bedCount(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}

class BathRoomCountWidget extends GetView<ManageMentHouseUpdateController> {
  const BathRoomCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Column(
          children: [
            SizedBox(
              width: Get.width - 80,
              child: Text(
                "욕실개수",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width - 80,
                  child: DropdownButton(
                    focusNode: controller.bathRoomCountTextFormFieldFocusNode,
                    alignment: Alignment.centerLeft,
                    isExpanded: true,
                    value: controller.bathRoomCount.value,
                    items: List.generate(
                      5,
                      (index) => DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: (index + 1).toString(),
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    onChanged: (Object? value) =>
                        controller.bathRoomCount(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}

class AcreageWidget extends GetView<ManageMentHouseUpdateController> {
  const AcreageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            controller: controller.acreageTextFormFieldController,
            focusNode: controller.acreageTextFormFieldFocusNode,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.go,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(3),
            ],
            validator: (value) =>
                controller.handleValidator(type: "acreage", value: value),
            onFieldSubmitted: (value) =>
                controller.handleNextFocusNode(type: "acreage", value: value),
            onChanged: (value) => controller.globalFormKey.currentState!.save(),
            style: const TextStyle(color: kTextBodyColor, fontSize: 20),
            decoration: const InputDecoration(
              labelText: "평수",
              hintText: "평수를 입력해주세요.",
              hintStyle: TextStyle(
                color: Colors.black12,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}

class StartedAtWidget extends GetView<ManageMentHouseUpdateController> {
  const StartedAtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () =>
                      controller.handleDatePikcer(context: context, type: "시작"),
                  child: IgnorePointer(
                    child: TextFormField(
                      enabled: false,
                      controller: controller.startedAtTextFormFieldController,
                      focusNode: controller.startedAtTextFormFieldFocusNode,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.go,
                      onChanged: (value) =>
                          controller.globalFormKey.currentState!.save(),
                      style:
                          const TextStyle(color: kTextBodyColor, fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "숙박 시작날짜",
                        hintText: "시작날짜를 선택해주세요.",
                        hintStyle: TextStyle(
                          color: Colors.black12,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 30,
                child: IconButton(
                  onPressed: () =>
                      controller.handleDatePikcer(context: context, type: "시작"),
                  icon: const Icon(Icons.calendar_today_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      );
}

class EndedAtWidget extends GetView<ManageMentHouseUpdateController> {
  const EndedAtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () =>
                      controller.handleDatePikcer(context: context, type: "종료"),
                  child: IgnorePointer(
                    child: TextFormField(
                      enabled: false,
                      controller: controller.endedAtTextFormFieldController,
                      focusNode: controller.endedAtTextFormFieldFocusNode,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.go,
                      onChanged: (value) =>
                          controller.globalFormKey.currentState!.save(),
                      style:
                          const TextStyle(color: kTextBodyColor, fontSize: 20),
                      decoration: const InputDecoration(
                        labelText: "숙박 종료날짜",
                        hintText: "종료날짜를 선택해주세요.",
                        hintStyle: TextStyle(
                          color: Colors.black12,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 30,
                child: IconButton(
                  onPressed: () =>
                      controller.handleDatePikcer(context: context, type: "종료"),
                  icon: const Icon(Icons.calendar_today_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
        ],
      );
}

class BottomSheetOutlinedButtonWidget
    extends GetView<ManageMentHouseUpdateController> {
  const BottomSheetOutlinedButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Obx(
        () => Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
          width: double.infinity,
          height: 70,
          child: OutlinedButton(
            focusNode: controller.outlinedButtonFocusNode,
            child: Text(
              "수정",
              style: controller.outlinedButtonTextStyle(),
            ),
            style: controller.outlinedButtonStyle(),
            onPressed: () async {
              await controller.handleUpdateProvider();

              if (controller.isUpdateProvider.value) {
                Get.back();
                globalSnackBarWidget(message: "집 정보 수정이 완료되었습니다.");
              } else {
                if (controller.globalFormKey.currentState!.validate()) {
                  globalSnackBarWidget(
                      message: controller.reqeustMessage.value);
                }
              }
            },
          ),
        ),
      );
}
