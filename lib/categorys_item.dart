import 'package:flutter/material.dart';
class CategoryItem {
  final String id;
  final String title;
  final Color colors;

  const CategoryItem({
    @required this.id,
    @required this.title,
    this.colors = Colors.green,
  });
}
