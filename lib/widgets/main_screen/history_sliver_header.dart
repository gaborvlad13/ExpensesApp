import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HistorySliverHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: Delegate(),
      //pinned: true,
      floating: true,
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          //height: 230,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Here you can see and filter the history of\nyour expenses",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(100),
                    child: buildTextField(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
