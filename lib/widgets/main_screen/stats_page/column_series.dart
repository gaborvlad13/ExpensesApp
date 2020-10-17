import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnSeriesWidget extends StatelessWidget {
  final List<ExpenseDTO> _expensesDTO;
  ColumnSeriesWidget(this._expensesDTO);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: ScreenUtil().setHeight(190),
        child: SfCartesianChart(
          tooltipBehavior: TooltipBehavior(
              enable: true, header: 'Total', canShowMarker: false),
          series: <ChartSeries>[
            ColumnSeries<ExpenseDTO, String>(
              pointColorMapper: (ExpenseDTO expense, _) =>
                  Categories.categories[expense.name].color,
              enableTooltip: true,
              dataSource: _expensesDTO,
              xValueMapper: (ExpenseDTO expense, _) =>
                  _capitalLetter(expense.name),
              yValueMapper: (ExpenseDTO expense, _) => expense.total,
            )
          ],
          primaryXAxis: CategoryAxis(),
        ),
      ),
    );
  }

  String _capitalLetter(String str) {
    String toReturn = "";
    toReturn += str[0].toUpperCase();
    toReturn += str.substring(1);
    return toReturn;
  }
}
