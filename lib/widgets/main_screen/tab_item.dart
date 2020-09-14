import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  bool isSelected;
  Function pressed;
  TabItem({
    this.text,
    this.icon,
    this.isSelected,
    this.pressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(15),
        vertical: ScreenUtil().setHeight(5),
      ),
      child: InkWell(
        onTap: pressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? kPrimaryColor : Colors.grey,
              size: ScreenUtil().setSp(28),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(2),
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? kPrimaryColor : Colors.grey,
                fontSize: ScreenUtil().setSp(15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
