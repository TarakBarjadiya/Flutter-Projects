import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.categoryColor = Colors.orange,
  });

  final String id;
  final String title;
  final Color categoryColor;
}
