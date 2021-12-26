import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///filtering logic

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;
      _availableMeals = DUMMY_MEALS.where((mealObject) {
        if (!mealObject.isVegan && _filters['vegan'] == true) {
          return false;
        }

        if (!mealObject.isVegetarian && _filters['vegetarian'] == true) {
          return false;
        }

        if (!mealObject.isGlutenFree && _filters['gluten'] == true) {
          return false;
        }

        if (!mealObject.isLactoseFree && _filters['lactose'] == true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String Id) {
    final index = _favoriteMeals.indexWhere((element) => element.id == Id);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == Id));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
          secondary: Colors.amber,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
            bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed')),
      ),
      //home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealsDetailsScreen.routeName: (context) =>
            MealsDetailsScreen(_toggleFavorites, _isMealFavorite),
      },
    );
  }
}
