import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'enums.dart';
import 'grid_builder.dart';

class GridManager extends StatelessWidget {
  final List<Expense> _list;
  final String _val;
  final SearchType _searchType;
  GridManager(this._list, this._val, this._searchType);

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
      //print(_val);
      if (_val != null) {
        List<Expense> listAux;
        if (_searchType == SearchType.Title)
          listAux =
              _list.where((element) => element.title.contains(_val)).toList();
        else if (_searchType == SearchType.Description)
          listAux = _list
              .where((element) => element.description.contains(_val))
              .toList();
        return GridBuilder(listAux);
      }
      return GridBuilder(_list);
    }
  }
}
