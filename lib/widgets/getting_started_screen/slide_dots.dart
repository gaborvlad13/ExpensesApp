import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SlideDots extends StatelessWidget {
  final bool _isActive;
  SlideDots(this._isActive);

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtil();
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(8),
      ),
      height: _isActive ? screenUtil.setHeight(12) : screenUtil.setHeight(8),
      width: _isActive ? screenUtil.setHeight(12) : screenUtil.setHeight(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: _isActive ? Colors.teal : Colors.grey,
      ),
    );
  }
}
