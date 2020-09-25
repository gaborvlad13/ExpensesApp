import 'package:ExpensesApp/models/category.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/widgets/add_screen/details_form.dart';
import 'package:ExpensesApp/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../config/constants.dart';
import '../config/palette.dart';
import '../widgets/add_screen/category_header.dart';

class AddScreen extends StatefulWidget {
  static const routeName = 'add_page';

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _categoryKey = "food";
  String _title;
  String _description;
  double _price;
  DateTime _dateTime;

  void _modifyHeader(String key) {
    setState(() {
      _categoryKey = key;
    });
  }

  void _assignTitle(String title) {
    _title = title;
  }

  void _assignDescription(String description) {
    _description = description;
  }

  void _assignPrice(String price) {
    _price = double.parse(price);
  }

  void done() {
    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    //final Expense _expense = ModalRoute.of(context).settings.arguments;
    //final Expense _expense = Expense(category: Categories.categories['food']);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildFloatingActionButton(),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CategoryHeader(
                _categoryKey,
                Categories.categories[_categoryKey].icon,
                Categories.categories[_categoryKey].linearGradient,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 700,
                width: double.infinity,
                child: DetailsForm(
                  _formKey,
                  _modifyHeader,
                  _assignTitle,
                  _assignDescription,
                  _assignPrice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildFloatingActionButton() {
    return Container(
      height: ScreenUtil().setWidth(60),
      width: ScreenUtil().setWidth(60),
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: done,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Add or modify expense",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
        ),
      ),
      centerTitle: true,
    );
  }
}
