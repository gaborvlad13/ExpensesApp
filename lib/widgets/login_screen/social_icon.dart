import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatelessWidget {
  final _social;
  SocialIcon(this._social);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20),
          vertical: ScreenUtil().setHeight(20),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: ScreenUtil().setWidth(2),
            color: Colors.teal,
          ),
          shape: BoxShape.circle,
        ),
        child: _buildIcon(_social));
  }
}

FaIcon _buildIcon(_social) {
  if (_social == 'google')
    return FaIcon(
      FontAwesomeIcons.google,
      color: Palette.googleColor,
      size: ScreenUtil().setSp(20),
    );
  else if (_social == 'facebook')
    return FaIcon(
      FontAwesomeIcons.facebook,
      color: Palette.facebookColor,
      size: ScreenUtil().setSp(20),
    );
  return FaIcon(FontAwesomeIcons.eraser);
}
