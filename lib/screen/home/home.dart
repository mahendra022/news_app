import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_id/components/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topBar(),
          ],
        ),
      )),
    );
  }
}
