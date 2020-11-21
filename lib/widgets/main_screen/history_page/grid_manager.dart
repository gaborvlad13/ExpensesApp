import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'grid_builder.dart';

class GridManager extends StatelessWidget {
  final List<Expense> _list;
  final String _val;
  GridManager(this._list, this._val);

  @override
  Widget build(BuildContext context) {
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
      if (_val != null) {
        List<Expense> listAux;
        listAux = _list
            .where((element) =>
                element.title.toLowerCase().contains(_val.toLowerCase()))
            .toList();
        return GridBuilder(listAux);
      }
      return GridBuilder(_list);
    }
  }
}
