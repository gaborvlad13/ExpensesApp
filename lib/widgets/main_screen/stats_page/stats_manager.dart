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
        if ((date.isAfter(dateTimeFirst) ||
                date.isAtSameMomentAs(dateTimeFirst)) &&
            (date.isAtSameMomentAs(dateTimeSecond) ||
                date.isBefore(dateTimeSecond))) {
          int index = _checkIndexElement(_statsList, element.category);
          if (index == -1) {
            List<Expense> expenses = new List();
            expenses.add(element);
            _statsList.add(
              ExpenseDTO(
                  name: element.category,
                  expenses: expenses,
                  percent: 0,
                  total: element.price),
            );
          } else {
            _statsList[index].expenses.add(element);
            _statsList[index].total = _statsList[index].total + element.price;
          }
        }
      });

      var percentages = _getTruePercentages(_statsList);
      int it = 0;
      _statsList.forEach((element) {
        element.percent = percentages[it++];
      });
      return SliverToBoxAdapter(child: StatsBody(_statsList));
    }
  }

  List<int> _getTruePercentages(List<ExpenseDTO> statsList) {
    var aux = new List<double>();
    var toSort = new List<double>();
    var toAdd = new List<int>();
    double total = 0;
    int roundedSum = 0;
    int difference;
    statsList.forEach((element) {
      total += element.total;
    });

    statsList.forEach((element) {
      var percent = _calculatePercent(element.total, total);
      aux.add(percent);
      toSort.add(percent);
      toAdd.add(percent.floor());
      roundedSum += percent.floor();
    });
    difference = 100 - roundedSum;
    toSort.sort((a, b) => ((a + 1).floor() - a).compareTo((b + 1).floor() - b));
    for (int i = 0; i < aux.length; i++) {
      for (int j = 0; j < difference; j++) {
        if (aux[i] == toSort[j]) toAdd[i] += 1;
      }
    }
    return toAdd;
  }

  double _calculatePercent(double value, double total) {
    if (total == 0) return 0;
    return ((value / total) * 100);
  }

  int _checkIndexElement(List<ExpenseDTO> statsList, String elementCategory) {
    for (int i = 0; i < statsList.length; i++) {
      if (statsList[i].name == elementCategory) return i;
    }
    return -1;
  }
}
