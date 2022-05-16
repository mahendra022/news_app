import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/news_controller.dart';
import '../../../components/widget/tile/popularity_tile.dart';

class PopularitySlider extends StatelessWidget {
  const PopularitySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      margin: const EdgeInsets.only(top: 30.0),
      child: GetBuilder<NewsController>(
        init: NewsController(),
        initState: (_) {
          Get.put(NewsController()).fatchPopularity();
        },
        builder: (controller) {
          if (controller.popularity == null) {
            controller.fatchPopularity();
            return const SizedBox();
          }
          return SizedBox(
              height: 130.0,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.only(),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularityTile(news: controller.popularity![index]);
                },
              ));
        },
      ),
    );
  }
}
