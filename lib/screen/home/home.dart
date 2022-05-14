import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/components/colors.dart';

import '../../app/controllers/news_controller.dart';
import '../../app/databases/db_app.dart';
import '../../components/widget/category_tile.dart';
import '../../components/widget/news_tile.dart';
import '../../components/widget/popularity_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  topBar() {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                    color: ColorApp.color2,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Image.network(
                        'https://ilmupengetahuanumum.com/wp-content/uploads/2014/01/bendera-amerika-serikat.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text('US'),
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 25.0,
                        )),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              log('Search News');
            },
            child: Container(
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: ColorApp.main!.withOpacity(0.07),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.search,
                      color: ColorApp.main!.withOpacity(0.4),
                      size: 25.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Search News',
                      style: TextStyle(
                          color: ColorApp.main!.withOpacity(0.4),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  slidebar() {
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

  categories() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
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
          ),
          SizedBox(
            height: 50.0,
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
            height: 5.0,
          ),
          SizedBox(
            height: 50.0,
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

  content() {
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
          ),
          GetBuilder<NewsController>(
            init: NewsController(),
            initState: (_) {
              Get.put(NewsController()).fatchNews();
            },
            builder: (controller) {
              if (controller.news == null) {
                controller.fatchNews();
                return const SizedBox();
              }
              return SizedBox(
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
                  ));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [topBar(), slidebar(), categories(), content()],
        ),
      )),
    );
  }
}
