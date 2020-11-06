import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatefulWidget {
  final List<ExpenseDTO> _expenses;

  Pie(this._expenses);

  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ExpenseDTO, String>(
            enableSmartLabels: true,
            animationDuration: 500,
            pointColorMapper: (ExpenseDTO expense, _) =>
                Categories.categories[expense.name].color,
            dataSource: widget._expenses,
            dataLabelMapper: (ExpenseDTO data, _) => "${data.percent}%",
            dataLabelSettings: DataLabelSettings(
              labelIntersectAction: LabelIntersectAction.hide,
              alignment: ChartAlignment.center,
              textStyle: TextStyle(
                fontSize: ScreenUtil().setSp(15),
                color: Colors.white,
              ),
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              useSeriesColor: true,
            ),
            xValueMapper: (ExpenseDTO data, _) => data.name,
            yValueMapper: (ExpenseDTO data, _) => data.total,
            explode: false,
          ),
        ],
      ),
    );
  }
}
