import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/app/databases/db_app.dart';

class SearchController extends GetxController {
  final txtList = TextEditingController();
  RxString controllerText = ''.obs;
  RxList items = [].obs;

  @override
  void onInit() {
    super.onInit();
    txtList.addListener(() {
      controllerText.value = txtList.text;
    });
  }

  void querySearch(String query) {
    RxList dummySearchList = [].obs;
    if (query.isNotEmpty) {
      RxList dummyListData = [].obs;
      dummySearchList.addAll(suggestionsSearch);
      for (var item in dummySearchList) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      items.clear();
      items.addAll(dummyListData);
      return;
    } else {
      items.clear();
    }
  }
}
