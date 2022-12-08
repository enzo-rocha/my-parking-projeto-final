import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeSP extends ChangeNotifier {
  DarkModeSP() {
    _init();
  }

  bool _darkMode = false;
  get darkMode => _darkMode;

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('bool') ?? false;
    notifyListeners();
  }

  Future<void> changeDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = !_darkMode;
    await prefs.setBool('bool', _darkMode);
    notifyListeners();
  }
}