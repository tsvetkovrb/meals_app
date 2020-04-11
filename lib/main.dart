import 'package:flutter/material.dart';
import 'package:shop_app/helpers/theme/configure_theme.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/screens/category_meals.dart';
import 'package:shop_app/screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: configureTheme(),
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
