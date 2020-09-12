import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/login_screen/account_form.dart';
import '../widgets/login_screen/or_divider.dart';
import '../widgets/login_screen/social_icon.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login_screen';
  final AuthService _auth = AuthService();

  Future<void> _submitAuthForm(String email, String password) async {
    var authResult = await _auth.registerWithEmailAndPassword(email, password);
    print(authResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to Thissapp",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(32),
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(4),
                ),
                Text(
                  "Sign in with your email and password\nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(90),
                ),
                AccountForm(
                  _submitAuthForm,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(35),
                ),
                OrDivider(),
                SizedBox(
                  height: ScreenUtil().setHeight(25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon('google'),
                    SizedBox(
                      width: ScreenUtil().setWidth(30),
                    ),
                    SocialIcon('facebook'),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Thisapp?',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(4),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: kPrimaryColor,
                          decoration: TextDecoration.underline,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
