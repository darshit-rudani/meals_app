import 'package:flutter/material.dart';
import 'dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String CategoryId;
  // final String CategoryTitle;

  // CategoryMealScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeal[index].title);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}