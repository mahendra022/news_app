import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final txtList = TextEditingController();

  RxString controllerText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    txtList.addListener(() {
      controllerText.value = txtList.text;
    });
  }
}
