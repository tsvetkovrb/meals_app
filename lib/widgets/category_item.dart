import 'package:flutter/material.dart';

import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  const CategoryItem({this.id, this.title, this.bgColor});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => selectCategory(context),
        child: Card(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
    );
  }
}
