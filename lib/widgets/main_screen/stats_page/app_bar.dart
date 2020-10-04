import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "See your stats",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(18),
          color: Colors.black,
        ),
      ),
      elevation: 3,
    );
  }
}
