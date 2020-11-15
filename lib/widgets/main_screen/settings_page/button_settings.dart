import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ButtonSettings extends StatelessWidget {
  final Function _onPressed;
  final IconData _iconData;
  final String _title;
  final String _subtitle;
  final String _currency;
  ButtonSettings(this._onPressed, this._iconData, this._title, this._subtitle,
      this._currency);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => _onPressed(),
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: ScreenUtil().setHeight(50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
              ),
              child: Icon(
                _iconData,
                size: ScreenUtil().setSp(20),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Text(
                  _subtitle,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(12),
                  ),
                )
              ],
            ),
            SizedBox(
              width: ScreenUtil().setWidth(100),
            ),
            if (_currency != null)
              Text(
                _currency,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
