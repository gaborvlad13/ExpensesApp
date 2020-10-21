import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function pressed;
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
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(5),
      ),
      child: GestureDetector(
        onTap: pressed,
        child: Container(
          color: Colors.transparent,
          width: ScreenUtil().setWidth(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? kPrimaryColor : Colors.grey,
                size: ScreenUtil().setSp(25),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(2),
              ),
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? kPrimaryColor : Colors.grey,
                  fontSize: ScreenUtil().setSp(13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
