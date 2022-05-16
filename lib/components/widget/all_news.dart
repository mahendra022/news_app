// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:news_id/app/models/news_model.dart';
import '../../components/colors.dart';
import 'tile/selection_tile.dart';

class AllNews extends StatelessWidget {
  const AllNews({Key? key, this.articles}) : super(key: key);

  final List<Articles>? articles;

  content(context) {
    if (articles == null) {
      return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 150.0,
          child: Center(
            child: CircularProgressIndicator(
              color: ColorApp.color2,
            ),
          ),
        ),
      );
    }
    return SizedBox(
        child: ListView.builder(
      itemCount: articles!.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return SelectionTile(news: articles![index]);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'News',
          style: TextStyle(
              color: ColorApp.color2,
              fontSize: 18.0,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorApp.main,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [content(context)],
            )),
      ),
    );
  }
}
