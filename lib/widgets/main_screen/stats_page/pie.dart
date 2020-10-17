import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatefulWidget {
  final List<ExpenseDTO> _expenses;
  final int _touchIndex;
  Pie(this._expenses, this._touchIndex);

  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(250),
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ExpenseDTO, String>(
            pointColorMapper: (ExpenseDTO expense, _) =>
                Categories.categories[expense.name].color,
            dataSource: widget._expenses,
            xValueMapper: (ExpenseDTO data, _) => data.name,
            yValueMapper: (ExpenseDTO data, _) => data.total,
            explode: false,
          ),
        ],
      ),
    );
  }
}
