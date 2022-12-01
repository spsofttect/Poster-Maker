import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_import


var title = "Preferences";

Preferences preferences = Preferences();

class Preferences {
  Preferences._();

  static final Preferences preferences = Preferences._();

  factory Preferences() {
    return preferences;
  }

  SharedPreferences _prefs;

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs;

    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<bool> saveString({String key, String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<String> getString({String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> saveBool({String key, bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }

  Future<bool> getBool({String key, bool defValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defValue;
  }

  Future clearPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
