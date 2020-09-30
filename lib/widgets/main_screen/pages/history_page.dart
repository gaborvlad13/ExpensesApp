import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/widgets/main_screen/grid_manager.dart';
import 'package:ExpensesApp/widgets/main_screen/history_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
            initialData: [
              Expense(
                id: "initial",
                category: "",
                date: DateTime.now(),
                description: "",
                price: 0.00,
                title: "",
              ),
            ],
            value: Database().getExpenses(userProvider.uid),
            child: GridManager(),
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
