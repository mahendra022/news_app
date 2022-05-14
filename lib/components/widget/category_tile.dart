import 'package:flutter/material.dart';
import 'package:news_id/app/models/category_model.dart';
import 'package:news_id/screen/selection/selection.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, this.category}) : super(key: key);

  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectionScreen(
                    category: category,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
              colors: [
                category!.color!,
                category!.color!.withOpacity(0.88),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 0.8],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          children: [
            SizedBox(
                height: 30.0,
                child: Icon(
                  category!.icon,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              category!.title.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
