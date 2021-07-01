import 'package:flutter/material.dart';
import 'package:meals/main_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

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
