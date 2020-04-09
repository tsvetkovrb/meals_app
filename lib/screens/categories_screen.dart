import 'package:flutter/material.dart';
import 'package:shop_app/helpers/data.dart';
import 'package:shop_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(
                    title: category.title,
                    bgColor: category.color,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
