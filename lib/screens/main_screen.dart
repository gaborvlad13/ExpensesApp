import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/widgets/main_screen/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widgets/main_screen/pages/history_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPosition = 0;
  final _tabs = ["Home", "Stats", "Ceva", "Settings"];
  final _pages = [
    HistoryPage(),
    Container(
      child: Text("test"),
    ),
    Container(
      child: Text("test"),
    ),
    Container(
      child: Text("test"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context,
       // width: 392.72, height: 713.45, allowFontScaling: false);
    //String _uid = Provider.of<UserLocal>(context).uid;
    return Scaffold(
      body: _pages[_selectedPosition],
      floatingActionButton: Container(
        height: ScreenUtil().setWidth(60),
        width: ScreenUtil().setWidth(60),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Database().addExpense(
                "ceva",
                Expense(
                  title: "ceva",
                  categorie: "lifestyle",
                  description: "ceva",
                  price: 23.4,
                  date: "23.04.2020",
                ),
              );
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: ScreenUtil().setSp(28),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  void _changePosition(int position) {
    setState(() {
      _selectedPosition = position;
    });
  }

  _buildBottomBar() {
    return BottomAppBar(
      elevation: 10,
      shape: CircularNotchedRectangle(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TabItem(
              icon: Icons.home,
              text: "Home",
              isSelected: _selectedPosition == 0,
              pressed: () => _changePosition(0),
            ),
            TabItem(
              icon: Icons.show_chart,
              text: "Stats",
              isSelected: _selectedPosition == 1,
              pressed: () => _changePosition(1),
            ),
            SizedBox(
              width: 40,
            ),
            TabItem(
              icon: Icons.restaurant_menu,
              text: "Ceva",
              isSelected: _selectedPosition == 2,
              pressed: () => _changePosition(2),
            ),
            TabItem(
              icon: Icons.settings,
              isSelected: _selectedPosition == 3,
              text: "Settings",
              pressed: () => _changePosition(3),
            ),
          ],
        ),
      ),
    );
  }
}
/*class MainScreen extends StatelessWidget {
  static const routeName = "/main_screen";
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<List<Expense>>(context);
    return provider != null
        ? Scaffold(
            body: ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: Database().test,
                    child: Text(provider[index].date.toIso8601String()),
                  ),
                ],
              );
            },
            itemCount: provider.length,
          ))
        : CircularProgressIndicator();
  }
}*/
