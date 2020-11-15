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
import '../providers/admob_service.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'dart:math';

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
  final _addMobService = AddMobService();
  String _categoryKey;
  String _id;

  InterstitialAd _interstitialAd;
  @override
  void initState() {
    if (widget._expense != null) {
      _categoryKey = widget._expense.category;
      _id = widget._expense.id;
    } else {
      _categoryKey = "food";
      _id = "";
    }
    _initializeAd();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    super.dispose();
  }

  void _modifyHeader(String key) {
    setState(() {
      _categoryKey = key;
    });
  }

  void _initializeAd() {
    _interstitialAd = InterstitialAd(
        adUnitId: _addMobService.getInterstitialAdId(),
        listener: (MobileAdEvent event) {});
    _interstitialAd.load();
  }

  Future<void> _showAd() async {
    await _interstitialAd.show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );
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

      if (_id == "") {
        _db.addExpense(
          userProvider.uid,
          expense,
        );
      } else
        _db.updateExpense(
          userProvider.uid,
          _id,
          expense,
        );
      return true;
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
              Hero(
                tag: _id,
                child: CategoryHeaderImage(
                  _categoryKey,
                  Categories.categories[_categoryKey].icon,
                  Categories.categories[_categoryKey].color,
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
            if (result != null) {
              Random random = new Random();
              int randomNumber = random.nextInt(100);
              if (randomNumber < 40) await _showAd();
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF8B8B8B),
          size: ScreenUtil().setSp(20),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      toolbarHeight: ScreenUtil().setSp(45),
      title: Text(
        "Add or modify expense",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(18),
        ),
      ),
      centerTitle: true,
    );
  }
}
