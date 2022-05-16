import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/app/controllers/search_controller.dart';
import 'package:news_id/components/widget/categories_news.dart';
import 'package:news_id/screen/search/components/navbar_search.dart';
import 'components/content_search.dart';
import 'components/suggestion.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SearchController());

  categories(context) {
    return Obx(() {
      return _controller.controllerText.isEmpty
          ? const CategoriesNews()
          : const SizedBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavbarSearch(controller: _controller),
                  Suggestion(controller: _controller),
                  categories(context),
                  ContentSearch(controller: _controller),
                ],
              )),
        ));
  }
}
