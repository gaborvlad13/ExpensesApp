import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/providers/auth_service.dart';
import 'package:ExpensesApp/providers/auth_service_social.dart';
import 'package:ExpensesApp/screens/main_screen.dart';
import 'package:ExpensesApp/providers/auth_service.dart';
import 'package:ExpensesApp/widgets/login_screen/login_errors.dart';
import 'package:ExpensesApp/widgets/login_screen/register_errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/login_screen/account_form.dart';
import '../widgets/login_screen/or_divider.dart';
import '../widgets/login_screen/social_icon.dart';
import '../widgets/login_screen/enums.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final AuthServiceSocial _authServiceSocial = AuthServiceSocial();
  var _authForm = AuthForm.Login;

  Future _submitAuthFormRegister(
      String email, String password, BuildContext ctx) async {
    try {
      dynamic authResult =
          await _auth.registerWithEmailAndPassword(email, password);
      return authResult;
    } catch (e) {
      //print(e.toString());
      var message = RegisterErrors.show(e.code);
      _showSnackBar(ctx, message);
      return null;
    }
  }

  Future _submitAuthFormLogin(
      String email, String password, BuildContext ctx) async {
    try {
      dynamic authResult =
          await _auth.loginWithEmailAndPassword(email, password);
      return authResult;
    } catch (e) {
      var message = LoginErrors.show(e.code);
      _showSnackBar(ctx, message);
      return null;
    }
  }

  Future _googleSignIn() async {
    try {
      dynamic authResult = await _authServiceSocial.googleSignIn();
      return authResult;
    } catch (e) {
      print(e.toString());
    }
  }

  void _showSnackBar(BuildContext ctx, String message) {
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
        duration: Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _authForm == AuthForm.Login ? 'Sign In' : 'Sign Up',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
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
                      "Welcome to Paper",
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
                  _authForm == AuthForm.Login
                      ? "Sign in with your email and password\nor continue with google"
                      : "Sign up with your email and password\nor go back and continue with google",
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
                  _submitAuthFormLogin,
                  _submitAuthFormRegister,
                  _authForm,
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(35),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _authForm == AuthForm.Login
                          ? 'New to Thisapp?'
                          : 'Already have an account?',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(4),
                    ),
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            if (_authForm == AuthForm.Login)
                              _authForm = AuthForm.SignUp;
                            else
                              _authForm = AuthForm.Login;
                          },
                        );
                      },
                      child: Text(
                        _authForm == AuthForm.Login ? 'Register' : 'Login',
                        style: TextStyle(
                          color: kPrimaryColor,
                          decoration: TextDecoration.underline,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    )
                  ],
                ),
                if (_authForm == AuthForm.Login) ...[
                  SizedBox(
                    height: ScreenUtil().setHeight(35),
                  ),
                  OrDivider(),
                  SizedBox(
                    height: ScreenUtil().setHeight(22),
                  ),
                  SocialIcon(
                    color: kGoogleColor,
                    icon: FontAwesomeIcons.google,
                    press: () async {
                      dynamic result = await _googleSignIn();
                      if (result != null)
                        Navigator.pushNamed(context, MainScreen.routeName);
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
