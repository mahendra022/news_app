import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/search_controller.dart';
import '../../../components/colors.dart';
import 'news_search.dart';

class ContentSearch extends StatelessWidget {
  const ContentSearch({
    Key? key,
    required SearchController controller,
  })  : _controller = controller,
        super(key: key);

  final SearchController _controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _controller.controllerText.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                        color: ColorApp.color2,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                  GetBuilder<SearchController>(
                      init: _controller,
                      initState: (_) {
                        _controller.fatchHistorySearch();
                      },
                      builder: (controller) {
                        if (controller.getHistory != null) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 15.0),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: controller.getHistory!.length > 8
                                  ? 8
                                  : controller.getHistory!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewsSearchScreen(
                                                search: controller
                                                    .getHistory![index],
                                              )),
                                    );
                                  },
                                  child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 20.0,
                                            width: 20.0,
                                            child: IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                onPressed: () async {},
                                                icon: const Icon(
                                                  Icons.history,
                                                  size: 20.0,
                                                  color: Colors.black26,
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(controller.getHistory![index]),
                                        ],
                                      )),
                                );
                              },
                            ),
                          );
                        }
                        return const SizedBox();
                      })
                ],
              ),
            )
          : const SizedBox();
    });
  }
}
