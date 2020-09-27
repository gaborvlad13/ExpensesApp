import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/screens/add_screen.dart';
import 'package:ExpensesApp/widgets/main_screen/grid_item.dart';
import 'package:ExpensesApp/widgets/main_screen/history_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserLocal>(context);
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: buildTextField(),
          ),
          HistorySliverHeader(),
          StreamProvider<List<Expense>>.value(
            value: Database().getExpenses(userProvider.uid),
            child: Grid(),
          ),
        ],
      ),
    );
  }

  TextField buildTextField() {
    var outlineInputBorder = OutlineInputBorder(
      // borderRadius: BorderRadius.circular(100),
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
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<List<Expense>>(context);
    final userProvider = Provider.of<UserLocal>(context);
    print("build called");
    return list != null
        ? SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return FocusedMenuHolder(
                    onPressed: () {},
                    menuItems: [
                      FocusedMenuItem(
                          title: Text("ceva"),
                          onPressed: () {
                            Navigator.pushNamed(context, AddScreen.routeName);
                          },
                          trailingIcon: Icon(Icons.edit)),
                    ],
                    duration: Duration(milliseconds: 150),
                    child: GridItem(
                      list[index].title,
                      list[index].description,
                      list[index].price,
                      list[index].date,
                      list[index].category,
                    ),
                  );
                },
                childCount: list.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          )
        : SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
  }
}
