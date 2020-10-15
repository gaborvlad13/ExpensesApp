import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/stats_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class StatsManager extends StatelessWidget {
  final List<Expense> _list;
  final DateTime dateTimeFirst;
  final DateTime dateTimeSecond;

  StatsManager(this._list, this.dateTimeFirst, this.dateTimeSecond);

  @override
  Widget build(BuildContext context) {
    var _statsList = new List<ExpenseDTO>();
    var indexes = new Map<String, int>();
    int i = 0;
    Categories.categories.forEach(
      (key, value) {
        _statsList.add(
            new ExpenseDTO(expenses: new List<Expense>(), name: key, total: 0));
        indexes.putIfAbsent(key, () => i);
        i++;
      },
    );
    if (_list == null || _list.length == 0) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(30),
            horizontal: ScreenUtil().setWidth(15),
          ),
          child: Text(
            "Start adding some expenses.",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.grey[300],
            ),
          ),
        ),
      );
    } else if (_list[0].id == "initial") {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: ScreenUtil.screenHeight,
          width: ScreenUtil.screenWidth,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      _list.forEach((element) {
        var date = element.date;
        if (date.isAfter(dateTimeFirst) && date.isBefore(dateTimeSecond)) {
          _statsList[indexes[element.category]].expenses.add(element);
          _statsList[indexes[element.category]].total =
              _statsList[indexes[element.category]].total + element.price;
        }
      });
      return StatsBody(_statsList, _list);
    }
  }
}
