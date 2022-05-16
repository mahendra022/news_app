import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/news_controller.dart';
import '../../../components/colors.dart';
import '../../../components/widget/all_news.dart';
import '../../../components/widget/tile/news_tile.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        initState: (_) {
          Get.put(NewsController()).fatchNews();
        },
        builder: (controller) {
          if (controller.news == null) {
            controller.fatchNews();
            return const SizedBox();
          }
          return Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your news',
                      style: TextStyle(
                          color: ColorApp.color2,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AllNews(
                                    articles: controller.news!,
                                  )),
                        );
                      },
                      child: const Text(
                        'See all',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return NewsTile(news: controller.news![index]);
                      },
                    )),
              ],
            ),
          );
        });
  }
}
