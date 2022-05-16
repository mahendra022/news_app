import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/search_controller.dart';
import '../../../components/colors.dart';

class NavbarSearch extends StatelessWidget {
  const NavbarSearch({
    Key? key,
    required SearchController controller,
  })  : _controller = controller,
        super(key: key);

  final SearchController _controller;

  @override
  Widget build(BuildContext context) {
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
}
