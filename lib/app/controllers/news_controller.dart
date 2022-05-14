import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:news_id/app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  List<Articles>? _popularty;

  /// Fatch [by Popularity]
  void fatchPopularity() async {
    var url = Uri.parse(dotenv.get('API_URL') +
        'everything?q=apple&from=2022-05-13&to=2022-05-13&sortBy=popularity&apiKey=' +
        dotenv.get('KEY'));
    var response = await http.get(url);
    if (response.statusCode == 200) {
      _popularty = NewsModel.fromJson(json.decode(response.body)).articels;
      update();
    }
  }

  /// Getter [popularity]
  List<Articles>? get popularity {
    return _popularty;
  }
}
