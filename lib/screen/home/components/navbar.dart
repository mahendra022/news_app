import 'package:flutter/material.dart';

import '../../../components/colors.dart';
import '../../search/search.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore',
            style: TextStyle(
                color: ColorApp.color2,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
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
}
