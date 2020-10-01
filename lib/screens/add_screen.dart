import 'package:ExpensesApp/models/expense.dart';
import 'package:ExpensesApp/models/user_local.dart';
import 'package:ExpensesApp/providers/database.dart';
import 'package:ExpensesApp/widgets/add_screen/category_header_list.dart';
import 'package:ExpensesApp/widgets/add_screen/details_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import '../config/constants.dart';
import '../widgets/add_screen/category_header_image.dart';

class AddScreen extends StatefulWidget {
  static const routeName = 'add_page';
  final Expense _expense;
  AddScreen(this._expense);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final FormController _formController = FormController();
  final _db = Database();
  String _categoryKey;
  String _id;
  @override
  void initState() {
    if (widget._expense != null) {
      _categoryKey = widget._expense.category;
      _id = widget._expense.id;
    } else {
      _categoryKey = "food";
      _id = "";
    }
    super.initState();
  }

  void _modifyHeader(String key) {
    setState(() {
      _categoryKey = key;
    });
  }

  Future _addProduct(
    String title,
    String description,
    double price,
    DateTime date,
    BuildContext ctx,
  ) async {
    try {
      Expense expense = Expense(
        category: _categoryKey,
        date: date,
        description: description,
        price: price,
        title: title,
      );
      final userProvider = Provider.of<UserLocal>(context, listen: false);
      dynamic result;
      if (_id == "") {
        result = _db.addExpense(
          userProvider.uid,
          expense,
        );
      } else
        result = _db.updateExpense(
          userProvider.uid,
          _id,
          expense,
        );
      return result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build add form");
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildFloatingActionButton(),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: _id,
                child: CategoryHeaderImage(
                  _categoryKey,
                  Categories.categories[_categoryKey].icon,
                  Categories.categories[_categoryKey].linearGradient,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              CategoryHeaderList(_modifyHeader),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setWidth(30),
                ),
                width: double.infinity,
                child: DetailsForm(
                  widget._expense != null ? widget._expense.title : null,
                  widget._expense != null ? widget._expense.description : null,
                  widget._expense != null ? widget._expense.price : null,
                  widget._expense != null
                      ? widget._expense.date
                      : DateTime.now(),
                  _formController,
                  _addProduct,
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
          onPressed: () async {
            dynamic result = await _formController.submitForm();
            if (result != null) Navigator.of(context).pop();
          },
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
