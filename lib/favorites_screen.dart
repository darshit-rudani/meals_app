import 'package:flutter/material.dart';

import 'meal.dart';
import 'meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> isFavorites;

  FavoritesScreen(this.isFavorites);

  @override
  Widget build(BuildContext context) {

    if(isFavorites.isEmpty){
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: isFavorites[index].id,
            title: isFavorites[index].title,
            imageUrl: isFavorites[index].imageUrl,
            duration: isFavorites[index].duration,
            complexity: isFavorites[index].complexity,
            affordability: isFavorites[index].affordability,
          );
        },
        itemCount: isFavorites.length,
      );
    }

  }
}
