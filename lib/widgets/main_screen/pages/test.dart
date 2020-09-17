import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var expenses = Provider.of<List<Expense>>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return Text(expenses[index].date);
            },
            itemCount: expenses.length,
          )
        ],
      ),
    );
  }
}
