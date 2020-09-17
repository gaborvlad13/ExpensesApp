import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/widgets/main_screen/history_sliver_header.dart';
import 'package:ExpensesApp/widgets/main_screen/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserLocal>(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HistorySliverHeader(),
        StreamProvider<List<Expense>>.value(
          value: Database().getExpenses("userProvider.uid"),
          child: Grid(),
        ),
      ],
    );
  }
}

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<List<Expense>>(context);

    return list != null
        ? SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return FocusedMenuHolder(
                    onPressed: (){},
                    menuItems: [
                      FocusedMenuItem(title: Text("ceva"), onPressed: () {},trailingIcon: Icon(Icons.edit)),
                    ],
                    duration: Duration(milliseconds: 150),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue),
                      alignment: Alignment.center,
                      child: Text(list[index].categorie),
                    ),
                  );
                },
                childCount: list.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
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
