import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final Function press;
  final Color color;
  SocialIcon({this.icon, this.press, this.color});

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : InkWell(
            onTap: () async {
              setState(() {
                _isLoading = true;
              });
              await widget.press();
              setState(() {
                _isLoading = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20),
                vertical: ScreenUtil().setHeight(20),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: ScreenUtil().setWidth(2),
                  color: kPrimaryColor,
                ),
                shape: BoxShape.circle,
              ),
              child: _buildIcon(),
            ),
          );
  }

  FaIcon _buildIcon() {
    return FaIcon(
      widget.icon,
      color: widget.color,
      size: ScreenUtil().setSp(20),
    );
  }
}
