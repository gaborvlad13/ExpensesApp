import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ExpensesApp/providers/shared_preferences.dart';
class CategoryInformationText extends StatelessWidget {
  final double _totalPrice;
  final Expense _mostExpensive;
  final Expense _leastExpensive;
  final Expense _mostRecent;
  final _numberFormatter = NumberFormat.compact();

  CategoryInformationText(
    this._totalPrice,
    this._mostExpensive,
    this._leastExpensive,
    this._mostRecent,
  );

  @override
  Widget build(BuildContext context) {
    String mostExpensiveTitle = _mostExpensive.title;
    String leastExpensiveTitle = _leastExpensive.title;
    String mostRecentTitle = _mostRecent.title;
    String totalPrice = _numberFormatter.format(_totalPrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildText("Total price: $totalPrice ${sharedPrefs.currency}"),
        _buildText("Most expensive item: $mostExpensiveTitle "),
        _buildText("Least expensive item: $leastExpensiveTitle"),
        _buildText("Most recent item: $mostRecentTitle "),
      ],
    );
  }

  Widget _buildText(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      width: ScreenUtil().setWidth(220),
      height: ScreenUtil().setHeight(23),
      child: Text(
        text,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(
            12,
          ),
          fontWeight: FontWeight.bold,
          color: kGridTitleColor,
        ),
      ),
    );
  }
}
