import 'package:flutter/material.dart';
import 'package:shop_app/models/meal.dart';
import 'package:shop_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You\'re haven\'t favorite meals'),
      );
    }
    
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
