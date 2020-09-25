import 'package:ExpensesApp/config/constants.dart';
import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function modifyHeader;
  final Function assignTitle;
  final Function assignDescription;
  final Function assignPrice;
  DetailsForm(
    this.formKey,
    this.modifyHeader,
    this.assignTitle,
    this.assignDescription,
    this.assignPrice,
  );
  @override
  _DetailsFormState createState() => _DetailsFormState();
}

class _DetailsFormState extends State<DetailsForm> {
  DateTime dateTime = DateTime.now();
  String _title;
  String _description;
  String _priceAux;
  double _price;

  String _validateTitle(String title) {
    if (title == null || title.length == 0)
      return "Title field must not be empty";
  }

  String _validateDescription(String description) {
    if (description == null || description.length == 0)
      return "Description field must not be empty";
  }

  String _validatePrice(String price) {
    if (price == null || price.length == 0)
      return "Price field must not be empty";
    if (double.parse(price, (e) => null) == null)
      return "Price must be a numeric value";
    else if (double.parse(price) < 0) return "Price must be positive";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText("Categories:"),
        SizedBox(
          height: ScreenUtil().setHeight(12),
        ),
        Container(
          height: ScreenUtil().setHeight(110),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              ...Categories.categories.entries
                  .map((e) => _buildPreview(e.key, e.value)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
            vertical: ScreenUtil().setHeight(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Form(
                key: widget.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(15),
                    ),
                    _buildTextFormField(
                      20,
                      widget.assignTitle,
                      "Title",
                      "Enter title (max 20 chars)",
                      TextInputType.text,
                      _validateTitle,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    _buildTextFormField(
                      30,
                      widget.assignDescription,
                      "Description",
                      "Enter description (max 30 chars)",
                      TextInputType.text,
                      _validateDescription,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    _buildTextFormField(
                      10,
                      widget.assignPrice,
                      "Price",
                      "Enter price (max 10 chars)",
                      TextInputType.number,
                      _validatePrice,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    _buildDateForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black54,
        fontSize: ScreenUtil().setSp(20),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  GestureDetector _buildPreview(String key, Category category) {
    return GestureDetector(
      onTap: () {
        widget.modifyHeader(key);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(3),
          vertical: ScreenUtil().setHeight(5),
        ),
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: category.linearGradient,
        ),
        child: Icon(
          category.icon,
          color: Colors.white,
          size: ScreenUtil().setSp(40),
        ),
      ),
    );
  }

  TextFormField _buildDateForm() {
    return TextFormField(
      onTap: () async {
        DateTime dateTimeTest = await _pickDate();
        if (dateTimeTest != null) {
          setState(() {
            dateTime = dateTimeTest;
          });
        }
      },
      readOnly: true,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_today),
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(42),
          vertical: ScreenUtil().setHeight(20),
        ),
        labelText: 'Date',
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        hintText: dateTime.toIso8601String(),
        hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Future<DateTime> _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2021),
    );
    return date;
  }

  TextFormField _buildTextFormField(int maxLen, Function saved, String label,
      String hint, TextInputType type, Function validate) {
    return TextFormField(
      maxLength: maxLen,
      onSaved: (newValue) => saved(newValue),
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: type,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(42),
          vertical: ScreenUtil().setHeight(20),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: validate,
    );
  }
}
