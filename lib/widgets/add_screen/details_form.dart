import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/config/theme.dart';
import 'package:ExpensesApp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FormController {
  Future Function() submitForm;
}

class DetailsForm extends StatefulWidget {
  final String _initialTitle;
  final String _initialDescription;
  final double _initialPrice;
  final DateTime _initialDate;
  final FormController _controller;
  final Function(
    String title,
    String description,
    double price,
    DateTime date,
    BuildContext ctx,
  ) _submitForm;

  DetailsForm(
    this._initialTitle,
    this._initialDescription,
    this._initialPrice,
    this._initialDate,
    this._controller,
    this._submitForm,
  );
  @override
  _DetailsFormState createState() => _DetailsFormState(
        _controller,
      );
}

class _DetailsFormState extends State<DetailsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime _date;
  String _title;
  String _description;
  double _price;
  final _focusDescription = FocusNode();
  final _focusPrice = FocusNode();
  final _focusDate = FocusNode();

  _DetailsFormState(FormController _controller) {
    _controller.submitForm = _submitForm;
  }

  @override
  void initState() {
    _title = widget._initialTitle;
    _description = widget._initialDescription;
    _price = widget._initialPrice;
    _date = widget._initialDate;
    super.initState();
  }

  @override
  void dispose() {
    _focusDescription.dispose();
    _focusPrice.dispose();
    _focusDate.dispose();
    super.dispose();
  }

  Future _submitForm() async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      dynamic result = await widget._submitForm(
          _title, _description, _price, _date, context);
      return result;
    }
  }

  String _validateTitle(String title) {
    if (title == null || title.length == 0)
      return "Title field must not be empty";
    return null;
  }

  String _validateDescription(String description) {
    if (description == null || description.length == 0)
      return "Description field must not be empty";
    return null;
  }

  String _validatePrice(String price) {
    if (price == null || price.length == 0)
      return "Price field must not be empty";
    if (double.parse(price, (e) => null) == null)
      return "Price must be a numeric value";
    else if (double.parse(price) < 0) return "Price must be positive";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    print("build details");
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTitleFormField(),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            _buildDescriptionFormField(),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            _buildPriceFormField(),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            _buildDateForm(),
          ],
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
            _date = dateTimeTest;
          });
        }
      },
      readOnly: true,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      focusNode: _focusDate,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: _textFieldDecoration(
        "Date",
        DateFormat("dd.MM.yyy").format(_date),
      ),
    );
  }

  Future<DateTime> _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: calendarTheme(),
          child: child,
        );
      },
    );
    return date;
  }

  TextFormField _buildTitleFormField() {
    return TextFormField(
        initialValue: _title,
        textCapitalization: TextCapitalization.sentences,
        maxLength: 15,
        onSaved: (newValue) => _title = newValue,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(18),
        ),
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(_focusDescription),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: _textFieldDecoration("Title", "Enter title (max 15 chars)"),
        validator: _validateTitle);
  }

  TextFormField _buildDescriptionFormField() {
    return TextFormField(
      initialValue: _description,
      textCapitalization: TextCapitalization.sentences,
      maxLength: 30,
      onSaved: (newValue) => _description = newValue,
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      focusNode: _focusDescription,
      onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_focusPrice),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      decoration: _textFieldDecoration(
          "Description", "Enter description (max 30 chars)"),
      validator: _validateDescription,
    );
  }

  TextFormField _buildPriceFormField() {
    return TextFormField(
        initialValue: _price != null ? removeDecimalZeroFormat(_price) : null,
        maxLength: 10,
        onSaved: (newValue) => _price = double.parse(newValue),
        style: TextStyle(
          fontSize: ScreenUtil().setSp(18),
        ),
        focusNode: _focusPrice,
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(_focusDate),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: _textFieldDecoration("Price", "Enter price (max 10 chars)"),
        validator: _validatePrice);
  }

  InputDecoration _textFieldDecoration(String label, String hint) {
    return InputDecoration(
      errorStyle: TextStyle(
        fontSize: ScreenUtil().setSp(15),
      ),
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
    );
  }

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }
}
