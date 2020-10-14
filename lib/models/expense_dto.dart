import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseDTO {
  final String name;
  double total;
  List<Expense> expenses;
  ExpenseDTO({
    this.name,
    this.total,
    this.expenses,
  });
}
