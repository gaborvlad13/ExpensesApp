import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/enums.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/grid_manager.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/history_sliver_header.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/sliver_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String _val;
  SearchType _searchType = SearchType.Title;
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  List<Expense> _expenses;

  _onChangedListener() {
    setState(() {
      _val = _searchController.text;
    });
  }

  @override
  void initState() {
    _searchController.addListener(_onChangedListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _expenses = Provider.of<List<Expense>>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.removeListener(_onChangedListener);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidget(
            _focusNode,
            _searchController,
          ),
          HistorySliverHeader(),
          GridManager(
            _expenses,
            _val,
            _searchType,
          ),
        ],
      ),
    );
  }
}
