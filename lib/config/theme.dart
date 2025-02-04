import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    primaryColor: kPrimaryColor,
    accentColor: kAccentColor,
    appBarTheme: _appBarTheme(),
    fontFamily: "Helvetica",
    textTheme: _textTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
  );
}

ThemeData calendarTheme() {
  return ThemeData.light().copyWith(
    textSelectionColor: kPrimaryColor,
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
    ),
    buttonTheme: ButtonThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: kPrimaryColor,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
      ),
    ),
  );
}

TextTheme _textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0xFF8B8B8B),
      ),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(100),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
