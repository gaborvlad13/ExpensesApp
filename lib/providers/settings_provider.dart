import 'package:flutter/cupertino.dart';

class SettingsProvider with ChangeNotifier {
  String _currency;
  SettingsProvider() {
    _currency = 'USD';
  }

  String get currency => _currency;

  void setCurrency(String currency) {
    this._currency = currency;
    notifyListeners();
  }
}
