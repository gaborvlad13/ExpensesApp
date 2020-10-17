import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildText("Total price: $totalPrice RON"),
        _buildText("Most expensive item: $mostExpensiveTitle "),
        _buildText("Least expensive item: $leastExpensiveTitle"),
        _buildText("Most recent item: $mostRecentTitle "),
      ],
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(
          12,
        ),
        fontWeight: FontWeight.bold,
        color: kGridTitleColor,
      ),
    );
  }
}
