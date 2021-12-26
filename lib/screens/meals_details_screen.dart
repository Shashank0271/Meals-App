import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  Function toggleFavorites;
  Function isMealFavorite;
  MealsDetailsScreen(this.toggleFavorites, this.isMealFavorite, {Key? key})
      : super(key: key);
  Widget buildSectionTitle(BuildContext context, String string) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        string,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorites(mealId);
        },
        child: Icon(isMealFavorite(mealId) ? Icons.delete : Icons.favorite,
            color: Colors.black),
      ),
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                          "#${index.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
