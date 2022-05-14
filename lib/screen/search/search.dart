import 'package:flutter/material.dart';

import '../../app/databases/db_app.dart';
import '../../components/colors.dart';
import '../../components/widget/category_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  categories() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          SizedBox(
            height: 45.0,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: const EdgeInsets.only(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryTile(category: dataCategory1[index]);
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 45.0,
            child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              padding: const EdgeInsets.only(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryTile(category: dataCategory2![index]);
              },
            ),
          )
        ],
      ),
    );
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
            'Search',
            style: TextStyle(
                color: ColorApp.color2,
                fontSize: 18.0,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [categories()],
              )),
        ));
  }
}
