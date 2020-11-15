import 'dart:math';

import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/category_presentation.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/percentage_column.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/pie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'indicator.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/categories_card.dart';

class PieChartManager extends StatefulWidget {
  final List<ExpenseDTO> _expensesDTO;
  PieChartManager(this._expensesDTO);
  @override
  _PieChartManagerState createState() => _PieChartManagerState();
}

class _PieChartManagerState extends State<PieChartManager> {
  String _category = "";

  void modifyState(String category) {
    setState(() {
      _category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    ExpenseDTO expenseDTO;
    int index = _categoryIndex(_category);
    if (index != -1)
      expenseDTO = widget._expensesDTO[index];
    else
      expenseDTO = new ExpenseDTO(name: _category, expenses: []);
    return Column(
      children: [
        Card(
          elevation: 2,
          child: Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(290),
            child: widget._expensesDTO.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PercentageColumn(widget._expensesDTO),
                      Pie(widget._expensesDTO),
                    ],
                  )
                : Center(
                    child: Text(
                      "No data recorded",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
          ),
        ),
        CategoriesCard(modifyState),
        _category != ""
            ? CategoryPresentation(expenseDTO)
            : _buildNullPresentation(),
      ],
    );
  }

  int _categoryIndex(String category) {
    for (int i = 0; i < widget._expensesDTO.length; i++) {
      if (widget._expensesDTO[i].name == category) return i;
    }
    return -1;
  }

  Widget _buildNullPresentation() {
    return Card(
      child: Container(
        height: ScreenUtil().setSp(90),
        width: double.infinity,
        child: Center(
          child: Text(
            "Select a category",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: ScreenUtil().setSp(25),
            ),
          ),
        ),
      ),
    );
  }
}
