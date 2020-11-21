import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/app_bar.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/enums.dart';
import 'package:ExpensesApp/widgets/main_screen/stats_page/stats_manager.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
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
      List<DateTime> dates = await _getDates();
      if (dates != null && dates.length == 2) {
        setState(() {
          _value = value;
          _firstDate = dates.elementAt(0);
          _secondDate = dates
              .elementAt(1)
              .add(Duration(days: 1))
              .subtract(Duration(microseconds: 1));
          print(_secondDate);
        });
      } else
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("You have to pick two dates"),
            duration: Duration(milliseconds: 600),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
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
    return CustomScrollView(
      slivers: [
        AppBarWidget(_changeFilter),
        StatsManager(_expenses, _firstDate, _secondDate),
      ],
    );
  }
}
