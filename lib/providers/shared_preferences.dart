import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  String get currency => _sharedPrefs.getString('currency') ?? 'USD';

  set currency(String value) {
    _sharedPrefs.setString('currency', value);
  }
}

final sharedPrefs = SharedPrefs();
