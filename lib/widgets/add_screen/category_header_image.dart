import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryHeaderImage extends StatelessWidget {

  final IconData _icon;
  final Color _color;
  CategoryHeaderImage(this._icon, this._color);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
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
          FaIcon(
            _icon,
            color: Colors.white,
            size: ScreenUtil().setSp(80),
          ),
        ],
      ),
    );
  }
}
