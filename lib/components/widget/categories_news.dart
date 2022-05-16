import 'package:flutter/material.dart';

import '../../app/databases/db_app.dart';
import '../colors.dart';
import 'tile/category_tile.dart';

// ignore: must_be_immutable
class CategoriesNews extends StatelessWidget {
  CategoriesNews({Key? key, required this.header}) : super(key: key);

  bool? header;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          if (header!)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot topics',
                  style: TextStyle(
                      color: ColorApp.color2,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          else
            const SizedBox(),
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
}
