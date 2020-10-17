import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/column_series.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/pie_chart.dart';
import 'package:flutter/material.dart';

@override
class StatsBody extends StatelessWidget {
  final List<ExpenseDTO> _expensesDTO;
  StatsBody(this._expensesDTO);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PierChartWidget(_expensesDTO),
        ColumnSeriesWidget(_expensesDTO),
      ],
    );
  }
}
