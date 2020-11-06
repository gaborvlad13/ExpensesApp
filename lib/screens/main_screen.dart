import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/screens/add_screen.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/history_page.dart';
import 'package:ExpensesApp/widgets/main_screen/tab_item.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/notes_manager.dart';
import 'package:ExpensesApp/widgets/main_screen/notes_page/notes_page.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widgets/main_screen/settings_page/settings_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPosition = 0;
  var _pages;
  @override
  void didChangeDependencies() {
    _pages = [HistoryPage(), StatsPage(), NotesPage(), SettingsPage()];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72, height: 713.45, allowFontScaling: false);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _pages[_selectedPosition],
        floatingActionButton: Container(
          height: ScreenUtil().setWidth(60),
          width: ScreenUtil().setWidth(60),
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddScreen(null),
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
      ),
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
              icon: Icons.note,
              text: "Notes",
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
