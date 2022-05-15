import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_id/app/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_id/components/time_format.dart';
import 'package:ntp/ntp.dart';

class NewsController extends GetxController {
  List<Articles>? _popularty;
  List<Articles>? _category;
  List<Articles>? _news;
  ScrollController controller = ScrollController();

  /// Fatch [by Popularity]
  void fatchPopularity() async {
    var times = await NTP.now();
    var time = format4.format(times);
    var url = Uri.parse(dotenv.get('API_URL') +
        'everything?q=business&from=$time&to=$time&sortBy=popularity&apiKey=' +
        dotenv.get('KEY'));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      _popularty = NewsModel.fromJson(json.decode(response.body)).articels;
      update();
    }
  }

  /// Fatch data [News]
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

  /// Fatch data [By Categories]
  void fatchCategories(String category) async {
    var times = await NTP.now();
    var time = format4.format(times);
    try {
      var url = Uri.parse(dotenv.get('API_URL') +
          'everything?q=$category&from=$time&to=$time&apiKey=' +
          dotenv.get('KEY'));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        _category = NewsModel.fromJson(json.decode(response.body)).articels;
      }

      update();
    } catch (e) {
      log(e.toString());
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
