import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(100),
      color: Colors.teal,
      child: Container(
        height: ScreenUtil().setHeight(60),
        width: ScreenUtil().setWidth(300),
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                Icons.email,
                color: Colors.white,
                size: ScreenUtil().setSp(20),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Text(
                "Continue with Email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
