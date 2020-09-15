import 'package:ExpensesApp/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(30),
        vertical: ScreenUtil().setHeight(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(100),
            child: buildTextField(),
          ),
          Expanded(
            child: Center(
              child: Text(
                "No expense found",
                style: TextStyle(
                  color: kLightGrey,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextField buildTextField() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.white),
      gapPadding: 10,
    );
    return TextField(
      decoration: InputDecoration(
        hintText: "Search something",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: ScreenUtil().setSp(15),
        ),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        icon: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
