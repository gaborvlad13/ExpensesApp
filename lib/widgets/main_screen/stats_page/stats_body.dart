import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'category_presentation.dart';
import 'indicator.dart';

class StatsBody extends StatefulWidget {
  final List<ExpenseDTO> _expenses;
  StatsBody(this._expenses);
  @override
  _StatsBodyState createState() => _StatsBodyState();
}

@override
class _StatsBodyState extends State<StatsBody> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                height: ScreenUtil().setHeight(250),
                width: ScreenUtil().setWidth(250),
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlPanStart)
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 2,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              touchedIndex = index;
                            });
                          },
                          child: Indicator(
                            color: Categories
                                .categories[widget._expenses[index].name].color,
                            text: widget._expenses[index].name,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        )
                      ],
                    );
                  },
                  itemCount: widget._expenses.length,
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Container(
            height: ScreenUtil().setHeight(100),
            width: double.infinity,
            child: touchedIndex != null &&
                    touchedIndex >= 0 &&
                    touchedIndex <= widget._expenses.length
                ? CategoryPresentation(
                    widget._expenses[touchedIndex].name,
                    widget._expenses[touchedIndex].total,
                    _getMostExpensive(
                      widget._expenses[touchedIndex].expenses,
                    ),
                    _getLeastExpensive(
                      widget._expenses[touchedIndex].expenses,
                    ),
                    _getMostRecent(
                      widget._expenses[touchedIndex].expenses,
                    ),
                  )
                : _buildNotSelected(),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(Categories.categories.length, (i) {
      final isTouched = i == touchedIndex;
      final double radius = isTouched ? 110 : 100;
      var name = widget._expenses[i].name;
      var total = widget._expenses[i].total;

      return PieChartSectionData(
        color: Categories.categories[name].color,
        value: total,
        showTitle: false,
        radius: radius,
      );
    });
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

  Widget _buildNotSelected() {
    return Center(
      child: Text(
        "Select a category",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(25),
          color: Colors.black45,
        ),
      ),
    );
  }
}
