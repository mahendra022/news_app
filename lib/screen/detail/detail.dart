import 'package:flutter/material.dart';
import 'package:news_id/app/models/news_model.dart';
import 'package:news_id/components/time_format.dart';
import 'package:news_id/components/url_launcher.dart';

import '../../components/colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, this.articles}) : super(key: key);

  final Articles? articles;

  headline() {
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

  content() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          articles!.description!,
          style: const TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorApp.main,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      bottomNavigationBar: Container(
          height: 70.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30.0)),
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: Icon(Icons.star_border,
                      size: 22.0, color: Colors.amber[700]),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: Icon(
                    Icons.more_vert,
                    size: 22.0,
                    color: Colors.pink[500],
                  ),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [headline(), content()]),
      )),
    );
  }
}
