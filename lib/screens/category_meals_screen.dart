import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> displayedMeals;
  String? categoryTitle;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle ?? "")),
      body: ListView.builder(
          itemCount: displayedMeals.length,
          itemBuilder: (context, index) {
            Meal meal = displayedMeals[index];
            return MealItem(
              title: meal.title,
              imageUrl: meal.imageUrl,
              complexity: meal.complexity,
              duration: meal.duration,
              affordability: meal.affordability,
              id: meal.id,
              removeItem: _removeMeal,
            );
          }),
    );
  }
}
