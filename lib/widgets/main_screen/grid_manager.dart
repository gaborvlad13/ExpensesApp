import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/screens/add_screen.dart';
import 'package:ExpensesApp/widgets/main_screen/grid_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';

import 'grid_item.dart';

class GridManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _list = Provider.of<List<Expense>>(context);
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
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else
      return GridBuilder(_list);
  }
}
