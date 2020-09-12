import 'package:ExpensesApp/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AuthMode { Signup, Login }

class AccountForm extends StatefulWidget {
  final Future<void> Function(String email, String password) _submitForm;
  AccountForm(
    this._submitForm,
  );
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  var _email = '';
  var _password = '';

  String _validatePassword(String value) {
    Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
    RegExp regex = new RegExp(pattern);
    if (value.length < 8) return "Password must contain at least 8 characters";
    if (!regex.hasMatch(value))
      return 'Password must contain one uppercase letter,\none lowercase letter and a number';
    else
      return null;
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter valid Email';
    else
      return null;
  }

  Future<void> _trySubmit() async {
    print('intra');
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print('intra aici');
      _formKey.currentState.save();
      print(_email);
      await widget._submitForm(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build account form called");
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          DefaultButton(
            press: _trySubmit,
            text: 'Continue with Email',
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => _password = newValue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(42),
          vertical: ScreenUtil().setHeight(20),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        hintText: 'Enter your password',
        hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        suffixIcon: Icon(
          Icons.visibility_off,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
      validator: _validatePassword,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => _email = newValue,
      keyboardType: TextInputType.emailAddress,
      validator: _validateEmail,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(42),
          vertical: ScreenUtil().setHeight(20),
        ),
        labelText: 'Email',
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        hintText: 'Enter your email',
        hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
