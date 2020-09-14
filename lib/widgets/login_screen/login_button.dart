import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatefulWidget {
  final Future Function() press;
  final String text;
  const LoginButton({
    Key key,
    this.press,
    this.text,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            width: double.infinity,
            height: ScreenUtil().setHeight(48),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              color: kPrimaryColor,
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await widget.press();
                setState(() {
                  _isLoading = false;
                });
              },
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
