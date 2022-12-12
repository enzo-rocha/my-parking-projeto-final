import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeSP extends ChangeNotifier {
  DarkModeSP() {
    _init();
  }

  int _brightness = 0;
  List<bool> isSelected = [true, false];

  int get brightness => _brightness;

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _brightness = prefs.getInt('int') ?? 0;
    isSelected[0] = prefs.getBool('bool1') ?? true;
    isSelected[1] = prefs.getBool('bool2') ?? false;
    notifyListeners();
  }

  Future<void> changeDarkMode(int i) async {
    final prefs = await SharedPreferences.getInstance();
    _brightness = i;
    await prefs.setInt('int', _brightness);
    notifyListeners();
  }

  ThemeData selected() {
    if(_brightness == 0) {
      return ThemeData(brightness: Brightness.light);
    } else if(_brightness == 1) {
      return ThemeData(brightness: Brightness.dark);
    }
      return ThemeData(brightness: Brightness.light);
  }

  Future<void> saveIndex(int i, bool index1, bool index2) async {
    final prefs = await SharedPreferences.getInstance();
    isSelected[0] = index1;
    isSelected[1] = index2;
    prefs.setBool('bool1', index1);
    prefs.setBool('bool2', index2);
    notifyListeners();
  }
}