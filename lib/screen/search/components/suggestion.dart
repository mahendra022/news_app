import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/controllers/search_controller.dart';
import 'news_search.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({
    Key? key,
    required SearchController controller,
  })  : _controller = controller,
        super(key: key);

  final SearchController _controller;

  @override
  Widget build(BuildContext context) {
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
                  onTap: () async {
                    _controller.saveSearch(_controller.items[index]);
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
}
