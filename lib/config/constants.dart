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
    'transportation': Category(
      name: "transportation",
      icon: FontAwesomeIcons.bus,
      color: kTransportation,
    ),
    'recreational': Category(
      name: "recreational",
      icon: FontAwesomeIcons.cannabis,
      color: kRecreational,
    ),
    'education': Category(
      name: "education",
      icon: FontAwesomeIcons.book,
      color: kEducation,
    ),
    'clothes': Category(
      name: "clothes",
      icon: FontAwesomeIcons.tshirt,
      color: kClothesGradient,
    ),
    'entertainment': Category(
      name: "entertainment",
      icon: FontAwesomeIcons.gamepad,
      color: kEntertainment,
    ),
    'health & fitness': Category(
      name: "health & fitness",
      icon: FontAwesomeIcons.heartbeat,
      color: kHealthFitness,
    ),
    'utilities': Category(
      name: "utilities",
      icon: FontAwesomeIcons.lightbulb,
      color: kUtilities,
    ),
    'electronics': Category(
      name: "electronics",
      icon: FontAwesomeIcons.plug,
      color: kElectronics,
    ),
    'other': Category(
      name: "other",
      icon: FontAwesomeIcons.dollarSign,
      color: kOther,
    ),
  };
}
