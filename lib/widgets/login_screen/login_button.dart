import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginButton extends StatefulWidget {
  final Future<void> Function() _trySumbit;
  LoginButton(this._trySumbit);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
     print("build login called");
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Material(
            borderRadius: BorderRadius.circular(100),
            color: Colors.teal,
            child: Container(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(320),
              child: MaterialButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await widget._trySumbit();
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      Icons.email,
                      color: Colors.white,
                      size: ScreenUtil().setSp(20),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Text(
                      "Continue with Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
