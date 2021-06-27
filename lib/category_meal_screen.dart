import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String CategoryId;
  // final String CategoryTitle;

  // CategoryMealScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final CategoryId = routeArgs['id'];
    final CategoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle!),
      ),
      body: Center(
        child: Text(
          'The Recipes For Categorys',
        ),
      ),
    );
  }
}
