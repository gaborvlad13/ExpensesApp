import 'package:ExpensesApp/config/palette.dart';
import 'package:currency_pickers/country.dart';
import 'package:currency_pickers/currency_picker_dropdown.dart';
import 'package:currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:country_currency_chooser/country_currency_chooser.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: ScreenUtil().setHeight(45),
        title: _buildTitle(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Exit from app",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.2,
            ),
            Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Exit from app",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.2,
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                child: CurrencyChooserDialog(
                  animationDisabled: false,
                  dialogAnimationDuration: Duration(microseconds: 1),
                  borderColor: kPrimaryColor,
                  showListDividers: false,
                  interfaceColor: kPrimaryColor,
                  dialogStretch: DialogStretch.min,
                  pullToStartFloatingButtonColor: kAccentColor,
                  showPullToStartFloatingButton: false,
                ),
              ),
              child: Container(
                color: Colors.blue,
                height: 40,
                width: 40,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Settings",
      style: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        color: Colors.black,
      ),
    );
  }
}
