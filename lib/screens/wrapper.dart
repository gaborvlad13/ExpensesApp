import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/screens/login_screen.dart';
import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:ExpensesApp/screens/wrraper_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'getting_started_screen.dart';

class Wrapper extends StatelessWidget {
  static const routeName = "/wrapper";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserLocal>(context);
    if (user == null)
      return GetStartedScreen();
    else if (user.uid == "loading")
      return Scaffold(
        body: Center(
          child: Text("loading"),
        ),
      );
    else {
      return WrraperMainScreen();
    }
  }
}
