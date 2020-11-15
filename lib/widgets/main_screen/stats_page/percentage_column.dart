import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PercentageColumn extends StatelessWidget {
  final List<ExpenseDTO> _expensesDTO;
  PercentageColumn(this._expensesDTO);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ..._expensesDTO.map(
          (e) => Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(20),
                      color: Categories.categories[e.name].color,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(15),
                    ),
                    Text(
                      '${e.percent}%',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
