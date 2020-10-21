import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AppBarWidgetNotes extends StatelessWidget {
  final Function _onPressed;
  AppBarWidgetNotes(this._onPressed);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: ScreenUtil().setHeight(45),
      title: _buildTitle(),
      elevation: 1,
      pinned: true,
      forceElevated: true,
      actions: [
        IconButton(
          padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(5),
          ),
          icon: Icon(
            Icons.add,
            size: ScreenUtil().setSp(20),
          ),
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
