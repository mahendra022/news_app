import 'package:flutter/material.dart';
import 'package:news_id/app/models/news_model.dart';
import 'package:news_id/screen/detail/components/headline.dart';
import '../../components/colors.dart';
import 'components/bottom_bar.dart';
import 'components/content.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, this.articles}) : super(key: key);
  final Articles? articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorApp.main,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Headline(articles: articles),
          Content(articles: articles)
        ]),
      )),
    );
  }
}
