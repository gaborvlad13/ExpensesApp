import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/widgets/main_screen/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: _pages[_selectedPosition],
      appBar: AppBar(
        title: Text(
          _tabs[_selectedPosition],
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Container(
        height: ScreenUtil().setWidth(60),
        width: ScreenUtil().setWidth(60),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
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
