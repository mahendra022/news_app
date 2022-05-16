import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_id/app/controllers/search_controller.dart';
import '../../app/databases/db_app.dart';
import '../../components/colors.dart';
import '../../components/widget/category_tile.dart';
import 'components/news_search.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final _controller = Get.put(SearchController());
  searchBar(context) {
    return Container(
      margin: const EdgeInsets.only(top: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25.0,
                )),
          ),
          Container(
            height: 47,
            width: 290.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: ColorApp.main!.withOpacity(0.07),
            ),
            child: GetBuilder<SearchController>(
                init: _controller,
                builder: (controller) {
                  return TextFormField(
                    autofocus: true,
                    controller: controller.txtList,
                    enableInteractiveSelection: false,
                    textAlignVertical: TextAlignVertical.center,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      _controller.querySearch(value);
                    },
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(8),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20.0,
                      ),
                      hintStyle:
                          TextStyle(fontSize: 14.0, color: Colors.black26),
                      hintText: 'Search News',
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  categories(context) {
    return Obx(() {
      return _controller.controllerText.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 30.0),
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
            )
          : const SizedBox();
    });
  }

  content() {
    return Obx(() {
      return _controller.controllerText.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                        color: ColorApp.color2,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          : const SizedBox();
    });
  }

  sugestion() {
    return Obx(() => _controller.controllerText.isNotEmpty
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            margin: const EdgeInsets.only(top: 25.0),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  _controller.items.length > 5 ? 5 : _controller.items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsSearchScreen(
                                search: _controller.items[index],
                              )),
                    );
                  },
                  child: Container(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () async {},
                                icon: const Icon(
                                  Icons.search,
                                  size: 20.0,
                                  color: Colors.black26,
                                )),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(_controller.items[index]),
                        ],
                      )),
                );
              },
            ),
          )
        : const SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchBar(context),
                  sugestion(),
                  categories(context),
                  content(),
                ],
              )),
        ));
  }
}
