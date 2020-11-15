import 'package:ExpensesApp/config/palette.dart';
import 'package:ExpensesApp/providers/auth_service.dart';
import 'package:ExpensesApp/providers/settings_provider.dart';
import 'package:ExpensesApp/widgets/main_screen/settings_page/button_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:country_currency_chooser/country_currency_chooser.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  final AuthService _authService = AuthService();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _loadCurrency(provider) async {
    final SharedPreferences prefs = await _prefs;
    final currency = prefs.getString('currency') ?? 'USD';
    provider.setCurrency(currency);
  }

  void _saveCurrency(currency, provider) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('currency', currency);
    provider.setCurrency(currency);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    _loadCurrency(provider);
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
            ButtonSettings(
              _authService.signOut,
              Icons.exit_to_app,
              "Logout",
              "Exit to Welcome Screen",
              null,
            ),
            Divider(
              thickness: 1.2,
            ),
            ButtonSettings(
              () => showDialog(
                context: context,
                child: CurrencyChooserDialog(
                  selectedCurrency: (flag, currencyCode) {
                    _saveCurrency(currencyCode, provider);
                  },
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
              Icons.attach_money,
              "Select currency",
              "Select currency for the entire app",
              provider.currency,
            ),
            Divider(
              thickness: 1.2,
            ),
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
