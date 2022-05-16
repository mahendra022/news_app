import 'package:flutter/material.dart';

import '../../../components/colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 10,
              blurRadius: 15,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: ColorApp.color1!.withOpacity(0.3),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
                child: Center(
                    child: Row(
                  children: [
                    Icon(
                      Icons.sms_outlined,
                      color: ColorApp.main,
                      size: 18.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Add a comment',
                      style: TextStyle(
                          color: ColorApp.main, fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: ColorApp.color1!.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Icon(
                  Icons.share_outlined,
                  size: 22.0,
                  color: ColorApp.main,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Icon(Icons.star_border,
                    size: 22.0, color: Colors.amber[700]),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                ),
                child: Icon(
                  Icons.more_vert,
                  size: 22.0,
                  color: Colors.pink[500],
                ),
              )
            ],
          ),
        ));
  }
}
