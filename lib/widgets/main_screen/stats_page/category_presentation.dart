import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/category_information_text.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/category_lead.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CategoryPresentation extends StatelessWidget {
  final ExpenseDTO _expenseDTO;
  CategoryPresentation(this._expenseDTO);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
          height: ScreenUtil().setHeight(90),
          width: double.infinity,
          child: Row(
            children: [
              CategoryLead(
                Categories.categories[_expenseDTO.name].color,
                Categories.categories[_expenseDTO.name].icon,
                _expenseDTO.name,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(8),
              ),
              _expenseDTO.expenses.length > 0
                  ? CategoryInformationText(
                      _expenseDTO.total,
                      _getMostExpensive(
                        _expenseDTO.expenses,
                      ),
                      _getLeastExpensive(
                        _expenseDTO.expenses,
                      ),
                      _getMostRecent(
                        _expenseDTO.expenses,
                      ),
                    )
                  : _buildNullWidget(),
            ],
          )),
    );
  }

  Widget _buildNullWidget() {
    return Expanded(
      child: Center(
        child: Text(
          "No data yet",
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: ScreenUtil().setSp(25),
          ),
        ),
      ),
    );
  }

  Expense _getMostExpensive(List<Expense> expenses) {
    double max = -1;
    Expense toReturn;
    expenses.forEach((element) {
      if (element.price > max) max = element.price;
    });
    expenses.forEach((element) {
      if (element.price == max) toReturn = element;
    });

    return toReturn;
  }

  Expense _getLeastExpensive(List<Expense> expenses) {
    double min = double.maxFinite;
    Expense toReturn;
    expenses.forEach((element) {
      if (element.price < min) min = element.price;
    });
    expenses.forEach((element) {
      if (element.price == min) toReturn = element;
    });

    return toReturn;
  }

  Expense _getMostRecent(List<Expense> expenses) {
    DateTime mostRecent = DateTime.utc(2001);
    Expense toReturn;
    expenses.forEach((element) {
      if (element.date.isAfter(mostRecent)) mostRecent = element.date;
    });
    expenses.forEach((element) {
      if (element.date == mostRecent) return toReturn = element;
    });

    return toReturn;
  }
}
