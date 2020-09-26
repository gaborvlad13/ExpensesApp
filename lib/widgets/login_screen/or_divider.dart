import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
          children: [
            buildDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(5),
              ),
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                ),
              ),
            ),
            buildDivider(),
          ],
        ));
  }
}

Expanded buildDivider() {
  return Expanded(
    child: Divider(
      color: Colors.grey,
      height: ScreenUtil().setHeight(1.5),
    ),
  );
}
