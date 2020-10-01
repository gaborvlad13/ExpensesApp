import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/widgets/main_screen/enums.dart';
import 'package:ExpensesApp/widgets/main_screen/grid_manager.dart';
import 'package:ExpensesApp/widgets/main_screen/history_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String _val;
  SearchType _searchType = SearchType.Description;
  TextEditingController _searchController = TextEditingController();

  _onChangedListener() {
    //print(_searchController.text);
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
  void dispose() {
    _searchController.removeListener(_onChangedListener);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<List<Expense>>(context);
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: buildTextField(),
            //leading: Icon(Icons.meu),
          ),
          HistorySliverHeader(),
          GridManager(
            provider,
            _val,
            _searchType,
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
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search something",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: ScreenUtil().setSp(15),
        ),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        icon: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.menu),
        ),
      ),
    );
  }
}
