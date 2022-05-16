// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/app/models/category_model.dart';
import '../../app/controllers/news_controller.dart';
import '../../components/colors.dart';
import '../../components/widget/tile/selection_tile.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key, this.category}) : super(key: key);

  final CategoryModel? category;

  content(context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: GetBuilder<NewsController>(
          init: NewsController(),
          initState: (value) {
            value.setState(() {
              Get.put(NewsController())
                  .fatchCategories(category!.title.toString().toLowerCase());
            });
          },
          builder: (controller) {
            if (controller.category == null) {
              controller
                  .fatchCategories(category!.title.toString().toLowerCase());
              return SizedBox(
                height: MediaQuery.of(context).size.height - 150.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.color2,
                  ),
                ),
              );
            }
            return SizedBox(
                child: ListView.builder(
              controller: controller.controller,
              itemCount: controller.category!.length,
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
        centerTitle: true,
        title: Text(
          category!.title!,
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
              Get.reload<NewsController>();
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
