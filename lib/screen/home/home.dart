import 'package:flutter/material.dart';
import 'package:news_id/screen/home/components/content_home.dart';
import 'package:news_id/screen/home/components/navbar.dart';
import 'package:news_id/screen/home/components/popularity_silder.dart';
import '../../components/widget/categories_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Navbar(),
            PopularitySlider(),
            CategoriesNews(),
            ContentHome()
          ],
        ),
      )),
    );
  }
}
