import 'package:flutter/material.dart';
import 'package:news_id/components/colors.dart';
import '../../../app/models/news_model.dart';
import '../../../screen/detail/detail.dart';
import '../../time_format.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, this.news}) : super(key: key);

  final Articles? news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    articles: news,
                  )),
        );
      },
      child: SizedBox(
        height: 100.0,
        width: double.infinity,
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    news!.urlToImage ??
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 170.0,
                    padding: const EdgeInsets.only(top: 10.0, left: 5.0),
                    child: Text(
                      news!.title!,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: ColorApp.color2,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 215.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 5.0),
                          child: Text(
                            news!.source!.name!.toUpperCase(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            format1
                                .format(DateTime.parse(news!.publishedAt!))
                                .toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
