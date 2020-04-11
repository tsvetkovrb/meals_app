import 'package:flutter/material.dart';
import 'package:shop_app/screens/category_meals.dart';
import 'package:shop_app/screens/filters_screen.dart';
import 'package:shop_app/screens/meal_detail_screen.dart';
import 'package:shop_app/screens/tabs_screen.dart';

class Routes {
  static getRoutes() {
    return {
      '/': (ctx) => TabsScreen(),
      CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
      MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      FiltersScreen.routeName: (ctx) => FiltersScreen(),
    };
  }
}
