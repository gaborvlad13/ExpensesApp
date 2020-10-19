import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:ExpensesApp/screens/wrapper.dart';
import 'login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './enums.dart';

class AccountForm extends StatefulWidget {
  final Function(String email, String password, BuildContext ctx)
      _submitFormLogin;
  final Function(String email, String password, BuildContext ctx)
      _submitFormRegister;
  final _authForm;

  AccountForm(
    this._submitFormLogin,
    this._submitFormRegister,
    this._authForm,
  );
  @override
  _AccountFormState createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isVisiblePassword = false;
  var _isVisiblePasswordConfirmation = false;
  var _email = '';
  var _password = '';
  var _passwordConfirmation = '';
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();

  @override
  void dispose() {
    _focusPassword.dispose();
    _focusConfirmPassword.dispose();
    super.dispose();
  }

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
    if (!regex.hasMatch(value.trim()))
      return 'Enter valid Email';
    else
      return null;
  }

  Future _trySubmitLogin(BuildContext ctx) async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      dynamic result =
          await widget._submitFormLogin(_email.trim(), _password, ctx);
      return result;
    }
  }

  Future _trySubmitRegister(BuildContext ctx) async {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      if (_password == _passwordConfirmation) {
        dynamic result =
            await widget._submitFormRegister(_email.trim(), _password, ctx);
        return result;
      } else
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Passwords do not match"),
            backgroundColor: Theme.of(context).errorColor,
            duration: Duration(milliseconds: 600),
          ),
        );
    }
  }

  void _toggleVisibilityPassword() {
    setState(
      () {
        _isVisiblePassword = !_isVisiblePassword;
      },
    );
  }

  void _toggleVisibilityPasswordConfirmation() {
    setState(
      () {
        _isVisiblePasswordConfirmation = !_isVisiblePasswordConfirmation;
      },
    );
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
          if (widget._authForm == AuthForm.SignUp) ...[
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            buildConfirmPasswordFormField(),
          ],
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          LoginButton(
            press: () async {
              print("intra buton");
              dynamic result;
              if (widget._authForm == AuthForm.Login)
                result = await _trySubmitLogin(context);
              else
                result = await _trySubmitRegister(context);
              if (result != null)
                Navigator.pushReplacementNamed(context, Wrapper.routeName);
            },
            text: widget._authForm == AuthForm.Login
                ? 'Sign in with Email'
                : 'Sign up with Email',
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      onSaved: (newValue) => _password = newValue,
      textInputAction: widget._authForm == AuthForm.SignUp
          ? TextInputAction.next
          : TextInputAction.done,
      focusNode: _focusPassword,
      onFieldSubmitted: (_) {
        widget._authForm == AuthForm.SignUp
            ? FocusScope.of(context).requestFocus(_focusConfirmPassword)
            : FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: ScreenUtil().setSp(15),
        ),
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
        suffixIcon: Container(
          margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(5),
          ),
          child: IconButton(
            onPressed: _toggleVisibilityPassword,
            icon: _isVisiblePassword
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            iconSize: ScreenUtil().setSp(23),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: !_isVisiblePassword,
      validator: _validatePassword,
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      onSaved: (newValue) => _passwordConfirmation = newValue,
      textInputAction: TextInputAction.done,
      focusNode: _focusConfirmPassword,
      onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: ScreenUtil().setSp(15),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(42),
          vertical: ScreenUtil().setHeight(20),
        ),
        labelText: 'Confirm password',
        labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        hintText: 'Enter your password again',
        hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(16),
        ),
        suffixIcon: Container(
          margin: EdgeInsets.only(
            right: ScreenUtil().setWidth(5),
          ),
          child: IconButton(
            onPressed: _toggleVisibilityPasswordConfirmation,
            icon: _isVisiblePasswordConfirmation
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            iconSize: ScreenUtil().setSp(23),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: !_isVisiblePasswordConfirmation,
      validator: _validatePassword,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
      ),
      onSaved: (newValue) => _email = newValue,
      keyboardType: TextInputType.emailAddress,
      validator: _validateEmail,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(_focusPassword),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: ScreenUtil().setSp(15),
        ),
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
