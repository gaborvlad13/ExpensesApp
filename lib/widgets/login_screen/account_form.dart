import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AuthMode { Signup, Login }

class AccountForm extends StatefulWidget {
  final _formKey;
  AccountForm(this._formKey);
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  AuthMode _authMode = AuthMode.Login;
  var _isLoading = false;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _authMode == AuthMode.Signup
          ? ScreenUtil().setHeight(320)
          : ScreenUtil().setHeight(170),
      constraints: BoxConstraints(
        minHeight: _authMode == AuthMode.Signup
            ? ScreenUtil().setHeight(320)
            : ScreenUtil().setHeight(170),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(16),
        vertical: ScreenUtil().setHeight(16),
      ),
      child: Form(
        key: widget._formKey,
        child: Column(
          children: [
            _buildEmailTextForm(),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            _buildPasswordTextForm(),
          ],
        ),
      ),
    );
  }
}

TextFormField _buildEmailTextForm() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(10),
          left: ScreenUtil().setWidth(8),
          bottom: ScreenUtil().setHeight(2),
          top: ScreenUtil().setHeight(1),
        ),
        child: Icon(
          Icons.email,
          size: ScreenUtil().setSp(25),
        ),
      ),
      hintText: 'Email',
      //labelText: 'Email',
      hintStyle: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.teal),
      ),
    ),
  );
}

TextFormField _buildPasswordTextForm() {
  return TextFormField(
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      prefixIcon: Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(10),
          left: ScreenUtil().setWidth(8),
          bottom: ScreenUtil().setHeight(2),
          top: ScreenUtil().setHeight(1),
        ),
        child: Icon(
          Icons.lock,
          size: ScreenUtil().setSp(25),
        ),
      ),
      suffixIcon: Icon(
        Icons.visibility,
        size: ScreenUtil().setSp(25),
      ),
      hintText: 'Password',
      //labelText: 'Password',
      hintStyle: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.teal),
      ),
    ),
    obscureText: true,
  );
}
