import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ExpensesApp/config/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Palette.googleColor,
      child: Container(
        width: ScreenUtil().setWidth(300),
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                  size: ScreenUtil().setSp(15),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Continue with Google",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
