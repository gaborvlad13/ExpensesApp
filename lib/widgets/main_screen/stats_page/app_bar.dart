import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'enums.dart';

class AppBarWidget extends StatelessWidget {
  final Function _changeFilter;
  AppBarWidget(this._changeFilter);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //collapsedHeight: ScreenUtil().setHeight(35),
      toolbarHeight: ScreenUtil().setHeight(45),
      pinned: true,
      forceElevated: true,
      title: _buildTitleWidget(),
      elevation: 1,
      actions: [
        _buildPopupMenu(),
      ],
    );
  }

  Text _buildTitleWidget() {
    return Text(
      "Check your stats",
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        color: Colors.black,
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<FilterType>(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(5),
        ),
        icon: Icon(
          Icons.more_vert,
          size: ScreenUtil().setSp(20),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuItem<FilterType>>[
              PopupMenuItem<FilterType>(
                value: FilterType.AllTime,
                child: Text(
                  'All time',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
              PopupMenuItem<FilterType>(
                value: FilterType.Last7Days,
                child: Text(
                  'Last 7 days',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
              PopupMenuItem<FilterType>(
                value: FilterType.Last30Days,
                child: Text(
                  'Last 30 days',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
              PopupMenuItem<FilterType>(
                value: FilterType.DatePick,
                child: Text(
                  'Pick two dates',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
            ],
        onSelected: (FilterType value) async {
          await _changeFilter(value);
        });
  }
}
