import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumberOfLotsState extends ChangeNotifier {
  NumberOfLotsState() {
    _init();
  }

  int _numberOfLots = 0;
  int get numberOfLots => _numberOfLots;

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _numberOfLots = prefs.getInt('number') ?? 0;
    notifyListeners();
  }

  Future<void> changeNumberOfLots(controller) async {
    final prefs = await SharedPreferences.getInstance();
    final text = controller.toString();
    final number = int.parse(text);
    _numberOfLots = number;
    await prefs.setInt('number', _numberOfLots);
    notifyListeners();
  }
}