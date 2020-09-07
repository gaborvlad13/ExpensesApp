import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red,
          width: ScreenUtil().setWidth(232),
          height: ScreenUtil.screenHeight - ScreenUtil.statusBarHeight,
        ),
      ),
    );
  }
}
