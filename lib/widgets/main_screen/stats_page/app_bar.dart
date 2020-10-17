import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'enums.dart';

class AppBarWidget extends StatelessWidget {
  final Function _changeFilter;
  AppBarWidget(this._changeFilter);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(50),
      child: AppBar(
        title: _buildTitleWidget(),
        elevation: 1,
        actions: [
          _buildPopupMenu(),
        ],
      ),
    );
  }

  Text _buildTitleWidget() {
    return Text(
      "See your stats",
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        color: Colors.black,
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<FilterType>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<FilterType>>[
              PopupMenuItem<FilterType>(
                value: FilterType.AllTime,
                child: Text('All time'),
              ),
              PopupMenuItem<FilterType>(
                value: FilterType.Last7Days,
                child: Text('Last 7 days'),
              ),
              PopupMenuItem<FilterType>(
                value: FilterType.Last30Days,
                child: Text('Last 30 days'),
              ),
              PopupMenuItem<FilterType>(
                value: FilterType.DatePick,
                child: Text('Pick two dates'),
              ),
            ],
        onSelected: (FilterType value) async {
          await _changeFilter(value);
        });
  }
}
