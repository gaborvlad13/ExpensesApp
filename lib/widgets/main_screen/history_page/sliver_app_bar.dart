import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/widgets/main_screen/history_page/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SliverAppBarWidget extends StatefulWidget {
  final FocusNode _focusNode;
  final TextEditingController _searchController;
  SliverAppBarWidget(
    this._focusNode,
    this._searchController,
  );

  @override
  _SliverAppBarWidgetState createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  Widget _customSearchBarTitle;
  IconData _customSearchBarIcon;

  @override
  void initState() {
    _customSearchBarTitle = _buildTitleWidget();
    _customSearchBarIcon = Icons.search;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setStateAppBar() {
    setState(() {
      if (_customSearchBarIcon == Icons.search) {
        _customSearchBarIcon = Icons.cancel;
        _customSearchBarTitle = _buildTextField();
        widget._focusNode.requestFocus();
      } else {
        widget._searchController.clear();
        _customSearchBarIcon = Icons.search;
        _customSearchBarTitle = _buildTitleWidget();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: ScreenUtil().setHeight(45),
      forceElevated: true,
      elevation: 1,
      pinned: true,
      actions: [
        IconButton(
          padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(5),
          ),
          onPressed: _setStateAppBar,
          icon: Icon(
            _customSearchBarIcon,
            size: ScreenUtil().setSp(20),
          ),
        ),
      ],
      title: _customSearchBarTitle,
    );
  }

  Widget _buildTextField() {
    return TextField(
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      focusNode: widget._focusNode,
      controller: widget._searchController,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        hintText: "Search something",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: ScreenUtil().setSp(18),
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }

  Text _buildTitleWidget() {
    return Text(
      "Track your expenses",
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        color: Colors.black,
      ),
    );
  }
}
