import 'package:flutter/material.dart';
import './DUMMY_DATA.dart';
import './category_meal_screen.dart';
import './filters_screen.dart';
import './meal_detail_screen.dart';
import './tabs_screen.dart';
import 'meal.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoritesMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final _existingIndex =
        _favoritesMeal.indexWhere((meal) => meal.id == mealId);
    if (_existingIndex >= 0) {
      setState(() {
        _favoritesMeal.removeAt(_existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritesMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeal',
      theme: ThemeData.dark(),
      // home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoritesMeal),
        '/category-meals': (ctx) => CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
        TabsScreen.routeName: (ctx) => TabsScreen(_favoritesMeal),
      },
    );
  }
}
