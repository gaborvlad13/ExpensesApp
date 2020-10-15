import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/expense_dto.dart';
import 'package:ExpensesApp/providers/auth_service.dart';
import 'package:ExpensesApp/screens/wrapper.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/app_bar.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/enums.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/stats_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  var _value = FilterType.AllTime;
  var _expenses;

  _changeFilter(FilterType value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void didChangeDependencies() {
    _expenses = Provider.of<List<Expense>>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(_changeFilter),
          StatsManager(_expenses, DateTime.utc(1989, 11, 9), DateTime.now()),
        ],
      ),
    );
  }
}
