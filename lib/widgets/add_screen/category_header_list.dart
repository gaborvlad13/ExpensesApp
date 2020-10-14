import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryHeaderList extends StatelessWidget {
  final Function modifyHeader;
  CategoryHeaderList(this.modifyHeader);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: ScreenUtil().setHeight(110),
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            ...Categories.categories.entries
                .map((e) => _buildPreview(e.key, e.value)),
          ],
        ),
      ),
    ]);
  }

  GestureDetector _buildPreview(String key, Category category) {
    return GestureDetector(
      onTap: () {
        modifyHeader(key);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(3),
              vertical: ScreenUtil().setHeight(5),
            ),
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: category.color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  category.icon,
                  color: Colors.white,
                  size: ScreenUtil().setSp(40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  capitalLetter(key),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String capitalLetter(String str) {
    String toReturn = "";
    toReturn += str[0].toUpperCase();
    toReturn += str.substring(1);
    return toReturn;
  }
}
