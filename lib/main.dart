import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealsDetailsScreen.routeName: (context) => MealsDetailsScreen(),
      },
    );
  }
}
