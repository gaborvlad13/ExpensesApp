import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/category.dart';

class Categories {
  static const categories = {
    'food': Category(
      name: "food",
      icon: Icons.fastfood,
      linearGradient: kFoodGradient,
    ),
    'clothes': Category(
      name: "clothes",
      icon: FontAwesomeIcons.tshirt,
      linearGradient: kClothesGradient,
    ),
    'transportation': Category(
      name: "transportation",
      icon: FontAwesomeIcons.bus,
      linearGradient: kTransportation,
    ),
    'education': Category(
      name: "education",
      icon: FontAwesomeIcons.school,
      linearGradient: kEducation,
    ),
  };

   
}
