import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/history_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrraperMainScreen extends StatelessWidget {
  final _db = Database();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Expense>>.value(
      initialData: [
        Expense(
          id: "initial",
          category: "",
          date: DateTime.now(),
          description: "",
          price: 0.00,
          title: "",
        ),
      ],
      value: _db.getExpenses(Provider.of<UserLocal>(context).uid),
      child: MainScreen(),
    );
  }
}
