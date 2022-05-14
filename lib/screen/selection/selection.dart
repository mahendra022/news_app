import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/app/models/category_model.dart';
import '../../app/controllers/news_controller.dart';
import '../../components/colors.dart';
import '../../components/widget/selection_tile.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key, this.category}) : super(key: key);

  final CategoryModel? category;

  content() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: GetBuilder<NewsController>(
          init: NewsController(),
          initState: (_) {
            Get.put(NewsController())
                .fatchCategories(category!.title.toString().toLowerCase());
          },
          builder: (controller) {
            if (controller.category == null) {
              controller
                  .fatchCategories(category!.title.toString().toLowerCase());
              return const SizedBox();
            }
            return SizedBox(
                child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.only(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return SelectionTile(news: controller.category![index]);
              },
            ));
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
              children: [content()],
            )),
      ),
    );
  }
}
