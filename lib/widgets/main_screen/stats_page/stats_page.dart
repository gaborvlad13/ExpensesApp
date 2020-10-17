import 'package:ExpensesApp/models/expense.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:ExpensesApp/widgets/main_screen/stats_page/app_bar.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/enums.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/stats_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  var _value = FilterType.AllTime;
  DateTime _firstDate;
  DateTime _secondDate;
  var _expenses;

  _getDates() async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: (new DateTime.now()).subtract(new Duration(days: 7)),
      initialLastDate: DateTime.now(),
      firstDate: new DateTime(2001),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked.length == 2) {
      return picked;
    }
  }

  _changeFilter(FilterType value) async {
    if (value == FilterType.DatePick) {
      List<DateTime> expense = await _getDates();
      setState(() {
        _value = value;
        _firstDate = expense.elementAt(0);
        _secondDate = expense.elementAt(1);
      });
    } else
      setState(() {
        _value = value;
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  DateTime _daysBackInTime(DateTime date, int noOfDays) {
    DateTime toReturn = date;
    toReturn = toReturn.subtract(Duration(days: noOfDays));
    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    //_expenses = Provider.of<List<Expense>>(context);
    _expenses = Provider.of<List<Expense>>(context);
    if (_value == FilterType.AllTime) {
      _firstDate = DateTime.utc(1989, 11, 9);
      _secondDate = DateTime.now();
    } else if (_value == FilterType.Last7Days) {
      _secondDate = DateTime.now();
      _firstDate = _daysBackInTime(_secondDate, 7);
    } else if (_value == FilterType.Last30Days) {
      _secondDate = DateTime.now();
      _firstDate = _daysBackInTime(_secondDate, 30);
    }
    print(_firstDate);
    print(_secondDate);
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarWidget(_changeFilter),
          StatsManager(_expenses, _firstDate, _secondDate),
        ],
      ),
    );
  }
}
