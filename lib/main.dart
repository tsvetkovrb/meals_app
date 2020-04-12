import 'package:flutter/material.dart';
import 'package:shop_app/helpers/data.dart';
import 'package:shop_app/helpers/theme/configure_theme.dart';
import 'package:shop_app/models/meal.dart';
import 'package:shop_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      if (_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavorite(String mealId) {
    final existringIndex = _favoriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });

    if (existringIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existringIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    final int mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == id);
    return mealIndex >= 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: CustomTheme.configureTheme(),
      routes: Routes(
        meals: _availableMeals,
        setFilter: _setFilter,
        filters: _filters,
        favoriteMeals: _favoriteMeals,
        toggleFavorite: _toggleFavorite,
        isMealFavorite: _isMealFavorite,
      ).getRoutes(),
    );
  }
}
