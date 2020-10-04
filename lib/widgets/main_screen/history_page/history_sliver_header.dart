import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HistorySliverHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: Delegate(),
      pinned: true,
      floating: true,
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kPrimaryColor,
      height: 40,
      child: TabBar(
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(
            text: "All time",
          ),
          Tab(
            text: "7 days",
          ),
          Tab(
            text: "30 days",
          ),
          Tab(
            text: "Date interval",
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 40;

  @override
  // TODO: implement minExtent
  double get minExtent => 40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
