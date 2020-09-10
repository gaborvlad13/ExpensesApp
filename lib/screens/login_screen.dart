import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/login_screen/account_form.dart';
import '../widgets/login_screen/login_button.dart';
import '../widgets/login_screen/login_google_button.dart';
import '../widgets/login_screen/or_divider.dart';
import '../widgets/login_screen/social_icon.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login_screen';
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double leftCornerRadius = MediaQuery.of(context).size.height * 0.5;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(50),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
          bottom: ScreenUtil().setHeight(10),
        ),
        child: Column(
          children: [
            Container(
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/image1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(30),
            ),
            AccountForm(_formKey),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            LoginButton(),
            SizedBox(
              height: ScreenUtil().setHeight(30),
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
                      color: Colors.teal,
                      decoration: TextDecoration.underline,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            OrDivider(),
            SizedBox(
              height: ScreenUtil().setHeight(20),
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
          ],
        ),
      ),
    );
  }
}
