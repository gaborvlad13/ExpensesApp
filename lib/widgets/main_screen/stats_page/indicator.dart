import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  Indicator({
    Key key,
    this.color,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(18),
          height: ScreenUtil().setWidth(18),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(4),
        ),
        Text(
          _capitalLetter(text),
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
            fontWeight: FontWeight.bold,
            color: kGridTitleColor,
          ),
        )
      ],
    );
  }

  String _capitalLetter(String str) {
    String toReturn = "";
    toReturn += str[0].toUpperCase();
    toReturn += str.substring(1);
    return toReturn;
  }
}
