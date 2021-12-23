import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  MealsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: const Center(child: Text("hemlo")),
    );
  }
}
