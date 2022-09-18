import 'package:flutter/material.dart';
import '../Data/dummy_data.dart';
import '../Widgets/category_item.dart';

class CategoryRoute extends StatelessWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.title, cat.color, cat.id))
            .toList()));
  }
}
