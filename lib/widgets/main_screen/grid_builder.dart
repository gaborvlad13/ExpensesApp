import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/screens/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'grid_item.dart';

class GridBuilder extends StatelessWidget {
  final _list;
  GridBuilder(this._list);
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverPadding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setHeight(10),
        ),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 350),
                columnCount: 2,
                child: ScaleAnimation(
                  child: buildFocusedMenuHolder(
                    context,
                    _list,
                    index,
                  ),
                ),
              );
            },
            childCount: _list.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
        ),
      ),
    );
  }

  FocusedMenuHolder buildFocusedMenuHolder(
      BuildContext context, List<Expense> list, int index) {
    return FocusedMenuHolder(
      duration: Duration(milliseconds: 200),
      onPressed: () {},
      menuWidth: ScreenUtil().setWidth(
        220,
      ),
      menuItems: [
        _buildFocusedMenuItem(
          context,
          "Edit",
          () => Navigator.pushNamed(context, AddScreen.routeName),
          Icons.edit,
        ),
        _buildFocusedMenuItem(
          context,
          "Duplicate",
          () => Navigator.pushNamed(context, AddScreen.routeName),
          Icons.content_copy,
        ),
        _buildFocusedMenuItem(
          context,
          "Delete",
          () => Navigator.pushNamed(context, AddScreen.routeName),
          Icons.delete_forever,
        ),
      ],
      child: GridItem(
        list[index].id,
        list[index].title,
        list[index].description,
        list[index].price,
        list[index].date,
        list[index].category,
      ),
    );
  }

  FocusedMenuItem _buildFocusedMenuItem(
      BuildContext context, String text, Function pressed, IconData iconData) {
    return FocusedMenuItem(
      title: Text(
        text,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
        ),
      ),
      onPressed: pressed,
      trailingIcon: Icon(iconData),
    );
  }
}
