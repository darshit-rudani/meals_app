import 'package:flutter/material.dart';
import 'package:meals/main_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
      ),
      drawer: MainDrawer(),
      body: Text('Favorites'),
    );
  }
}
