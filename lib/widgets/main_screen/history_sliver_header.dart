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
            text: "Total",
          ),
          Tab(
            text: "Weekly",
          ),
          Tab(
            text: "Monthly",
          ),
          Tab(
            text: "Date pick",
          ),
        ],
      ),
    );
  }

  TextField buildTextField() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.transparent),
      gapPadding: 10,
    );
    return TextField(
      decoration: InputDecoration(
        hintText: "Search something",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: ScreenUtil().setSp(15),
        ),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        suffixIcon: Icon(Icons.filter_list),
        icon: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.search),
        ),
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
