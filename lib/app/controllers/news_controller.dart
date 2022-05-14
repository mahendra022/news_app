import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_id/app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  List<Articles>? _popularty;
  List<Articles>? _category;
  List<Articles>? _news;
  ScrollController controller = ScrollController();

  /// Fatch [by Popularity]
  void fatchPopularity() async {
    var url = Uri.parse(dotenv.get('API_URL') +
        'everything?q=business&from=2022-05-14&to=2022-05-14&sortBy=popularity&apiKey=' +
        dotenv.get('KEY'));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      _popularty = NewsModel.fromJson(json.decode(response.body)).articels;
      update();
    }
  }

  /// Fatch [News]
  void fatchNews() async {
    var url = Uri.parse(dotenv.get('API_URL') +
        'top-headlines?country=us&category=business&apiKey=' +
        dotenv.get('KEY'));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      _news = NewsModel.fromJson(json.decode(response.body)).articels;
      update();
    }
  }

  /// Fatch [News]
  void fatchCategories(String category) async {
    var url = Uri.parse(dotenv.get('API_URL') +
        'everything?q=$category&from=2022-05-14&to=2022-05-14&apiKey=' +
        dotenv.get('KEY'));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      _category = NewsModel.fromJson(json.decode(response.body)).articels;
      update();
    }
  }

  /// Getter [popularity]
  List<Articles>? get popularity {
    return _popularty;
  }

  /// Getter [category]
  List<Articles>? get category {
    return _category;
  }

  /// Getter [news]
  List<Articles>? get news {
    return _news;
  }
}
