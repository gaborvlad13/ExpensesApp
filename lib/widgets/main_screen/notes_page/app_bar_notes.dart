import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AppBarWidgetNotes extends StatelessWidget {
  final Function _onPressed;
  AppBarWidgetNotes(this._onPressed);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _buildTitle(),
      elevation: 1,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _onPressed,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      "Manage your notes",
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        color: Colors.black,
      ),
    );
  }
}
