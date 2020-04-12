import 'package:shop_app/models/meal.dart';
import 'package:shop_app/screens/category_meals.dart';
import 'package:shop_app/screens/filters_screen.dart';
import 'package:shop_app/screens/meal_detail_screen.dart';
import 'package:shop_app/screens/tabs_screen.dart';

class Routes {
  final List<Meal> meals;
  final List<Meal> favoriteMeals;
  final Function setFilter;
  final Function toggleFavorite;
  final Function isMealFavorite;
  final Map<String, bool> filters;


  Routes({
    this.meals,
    this.setFilter,
    this.filters,
    this.favoriteMeals,
    this.toggleFavorite,
    this.isMealFavorite,
  });

  getRoutes() {
    return {
      '/': (ctx) => TabsScreen(favoriteMeals),
      CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(meals),
      MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleFavorite, isMealFavorite),
      FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilter),
    };
  }
}
