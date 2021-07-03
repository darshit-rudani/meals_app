import 'package:flutter/material.dart';
import 'package:meals/category_meal_screen.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/filters_screen.dart';
import 'package:meals/meal_detail_screen.dart';
import 'package:meals/tabs_screen.dart';

import 'meal.dart';

void main() {
  runApp(MyApp());
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

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String,bool> filterData){
    _filters = filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      if(_filters['gluten'] && !meal.isGlutenFree){
        return false;
      }
      if(_filters['lactose'] && !meal.isLactoseFree){
        return false;
      }
      if(_filters['vegan'] && !meal.isVegan){
        return false;
      }
      if(_filters['vegetarian'] && !meal.isVegetarian){
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        '/category-meals': (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
        TabsScreen.routeName: (ctx) => TabsScreen(),
      },
    );
  }
}
