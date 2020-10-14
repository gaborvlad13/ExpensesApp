import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/category.dart';

class Categories {
  static const categories = {
    'food': Category(
      name: "food",
      icon: FontAwesomeIcons.hamburger,
      color: kFoodGradient,
    ),
    'clothes': Category(
      name: "clothes",
      icon: FontAwesomeIcons.tshirt,
      color: kClothesGradient,
    ),
    'transportation': Category(
      name: "transportation",
      icon: FontAwesomeIcons.bus,
      color: kTransportation,
    ),
    'education': Category(
      name: "education",
      icon: FontAwesomeIcons.school,
      color: kEducation,
    ),
  };
}
