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

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final FormController _formController = FormController();
  String _categoryKey = "food";
  void _modifyHeader(String key) {
    setState(() {
      _categoryKey = key;
    });
  }

  Future _addProduct(
      String title, String description, double price, DateTime date) async {
    try {
      final userProvider = Provider.of<UserLocal>(context, listen: false);
      dynamic result = Database().addExpense(
        userProvider.uid,
        Expense(
          category: _categoryKey,
          date: date,
          description: description,
          price: price,
          title: title,
        ),
      );

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildFloatingActionButton(),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CategoryHeaderImage(
                _categoryKey,
                Categories.categories[_categoryKey].icon,
                Categories.categories[_categoryKey].linearGradient,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              CategoryHeaderList(_modifyHeader),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Container(
                height: ScreenUtil().setHeight(360),
                width: double.infinity,
                child: DetailsForm(
                  _addProduct,
                  _formController,
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
            if (result != null) {
              Navigator.of(context).pop();
            }
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
