import 'package:flutter/material.dart';

import '../../../app/models/news_model.dart';
import '../../../components/colors.dart';
import '../../../components/time_format.dart';

class Headline extends StatelessWidget {
  const Headline({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final Articles? articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          format3.format(DateTime.parse(articles!.publishedAt!)) +
              " • ${articles!.source!.name}",
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w600),
        ),
        articles!.author != null
            ? Text(
                'Author  :   ' + articles!.author!,
                style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300),
              )
            : const SizedBox(
                height: 10.0,
              ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          articles!.title!,
          style: TextStyle(
              color: ColorApp.color2,
              fontSize: 20.0,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 15.0,
        ),
        SizedBox(
          height: 200.0,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              articles!.urlToImage ??
                  'https://www.ryanhart.org/img/featured_journal_empty.jpg',
              errorBuilder: ((context, error, stackTrace) {
                return Image.network(
                  'https://www.ryanhart.org/img/featured_journal_empty.jpg',
                  fit: BoxFit.fitHeight,
                );
              }),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ]),
    );
  }
}
