import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(child: Text('List is Empty'));
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            Meal meal = favoriteMeals[index];
            return MealItem(
              title: meal.title,
              imageUrl: meal.imageUrl,
              complexity: meal.complexity,
              duration: meal.duration,
              affordability: meal.affordability,
              id: meal.id,
            );
          });
    }
  }
}
