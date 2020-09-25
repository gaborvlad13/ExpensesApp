import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/category.dart';
import 'package:flutter/material.dart';

class CategoryController {
  final Map<String, Category> categories = {
    'food': Category(
      name: 'food',
      icon: Icons.fastfood,
      linearGradient: kGradients['food'],
    )
  };
  
}
