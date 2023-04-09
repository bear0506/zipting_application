import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityModel {
  CityModel({
    required this.abbreviation,
    required this.name,
  });

  String abbreviation;
  String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        abbreviation: json["sigla"],
        name: json["nome"],
      );

  static List<CityModel> listFromJson(list) =>
      List<CityModel>.from(list.map((x) => CityModel.fromJson(x)));
}

class CityController extends GetxController with StateMixin<List<CityModel>> {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }
}

class CityPage extends GetView<CityController> {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cities')),
      body: Container(
        child: controller.obx(
          (state) => ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              return Text(state[index].name);
            },
          ),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
