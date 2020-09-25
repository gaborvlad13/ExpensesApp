import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryHeader extends StatelessWidget {
  final String _title;
  final IconData _icon;
  final LinearGradient _linearGradient;
  CategoryHeader(this._title, this._icon, this._linearGradient);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _title,
      child: Container(
        height: ScreenUtil().setHeight(200),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: _linearGradient,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _icon,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
