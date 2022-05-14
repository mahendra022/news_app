import 'package:flutter/material.dart';
import '../../app/models/news_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, this.news}) : super(key: key);

  final Articles? news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => ProductDetail(product: product)),
        // );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 15.0),
        child: Stack(
          children: [
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  news!.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 15.0,
              child: Container(
                width: 180.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  news!.title!,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      inherit: true,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.9,
                      fontSize: 13.0,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.5, 1),
                            color: Colors.black26),
                      ]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
