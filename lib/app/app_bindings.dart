import 'package:get/get.dart';

import 'controllers/news_controller.dart';
import 'controllers/search_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
