import 'package:flutter/material.dart';
import 'package:shop_app/helpers/data.dart';
import 'package:shop_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: DUMMY_CATEGORIES
          .map((category) => CategoryItem(
                id: category.id,
                title: category.title,
                bgColor: category.color,
              ))
          .toList(),
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 200,
      //   childAspectRatio: 3 / 2,
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 20,
      // ),
    );
  }
}
