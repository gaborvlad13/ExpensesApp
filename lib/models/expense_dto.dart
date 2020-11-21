import 'package:ExpensesApp/models/expense.dart';

class ExpenseDTO {
  final String name;
  double total;
  int percent;
  List<Expense> expenses;
  ExpenseDTO({
    this.name,
    this.total,
    this.percent,
    this.expenses,
  });
}
