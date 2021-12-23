import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeals')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          children: DUMMY_CATEGORIES
              .map((cat) => CategoryItem(
                    title: cat.title,
                    color: cat.color,
                    id: cat.id,
                  ))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //width
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
