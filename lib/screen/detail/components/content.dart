import 'package:flutter/material.dart';

import '../../../app/models/news_model.dart';
import '../../../components/url_launcher.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final Articles? articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        articles!.description != null
            ? Text(
                articles!.description!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              )
            : const SizedBox(),
        const SizedBox(
          height: 15.0,
        ),
        articles!.content != null
            ? Text(
                articles!.content!
                    .substring(0, articles!.content!.indexOf('[')),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5.0,
        ),
        GestureDetector(
          onTap: () {
            openUrl(articles!.url!);
          },
          child: const Text('Read more',
              style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 0.5,
                  color: Colors.indigo,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700)),
        )
      ]),
    );
  }
}
