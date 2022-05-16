import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/app/databases/db_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  final txtList = TextEditingController();
  RxString controllerText = ''.obs;
  RxList items = [].obs;
  List<String>? _history;

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

  /// Save after search
  Future saveSearch(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var list = preferences.getStringList("history_search");
    try {
      if (list != null) {
        if (list.contains(value)) {
          log('item is already');
        } else {
          list.add(value);
          await preferences.setStringList("history_search", list);
        }
      } else {
        await preferences.setStringList("history_search", <String>[value]);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  /// feach history Search
  Future fatchHistorySearch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var list = preferences.getStringList("history_search");
    _history = list;
    update();
  }

  /// Getter History
  List<String>? get getHistory {
    return _history;
  }
}
