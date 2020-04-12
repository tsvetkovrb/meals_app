import 'package:flutter/material.dart';

import 'package:shop_app/models/meal.dart';
import 'package:shop_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final argumentsData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = argumentsData['title'];
    final id = argumentsData['id'];
    final categoryMeals =
        availableMeals.where((meal) => meal.categories.contains(id)).toList();
    final mealItemData = (index) => categoryMeals[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: mealItemData(index).id,
            title: mealItemData(index).title,
            imageUrl: mealItemData(index).imageUrl,
            duration: mealItemData(index).duration,
            affordability: mealItemData(index).affordability,
            complexity: mealItemData(index).complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
