import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryLead extends StatelessWidget {
  final Color _color;
  final IconData _icon;
  final String _name;

  CategoryLead(this._color, this._icon, this._name);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: ScreenUtil().setWidth(150),
      color: _color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            _icon,
            color: Colors.white,
            size: ScreenUtil().setSp(40),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            _capitalLetter(_name),
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _capitalLetter(String str) {
    String toReturn = "";
    toReturn += str[0].toUpperCase();
    toReturn += str.substring(1);
    return toReturn;
  }
}
