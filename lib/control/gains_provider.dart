import 'package:final_project/control/add_register_provider.dart';
import 'package:final_project/control/database.dart';
import 'package:final_project/model/price_model.dart';
import 'package:final_project/model/register_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GainsProvider with ChangeNotifier {

  GainsProvider() {
    getRegistersNotNull();
    getRegistersPrice();
    _init();
  }


  double _totalGains = 0;
  double get totalGains => _totalGains;

  Future<void> addGain(double newGain) async {
    final prefs = await SharedPreferences.getInstance();
    _totalGains += newGain;
    await prefs.setDouble('double', _totalGains);
    notifyListeners();
  }

  bool? _loading;

  List<Register> registerDatabaseFinished = [];
  List<Price> registerPrices = [];

  bool? get loading => _loading;

  Future<void> getRegistersNotNull() async {
    var db = DatabaseHelper();
    registerDatabaseFinished = await db.getRegistersNotNull();
    notifyListeners();
  }

  getRegistersPrice() async {
    var db = DatabaseHelper();
    registerPrices = await db.getRegistersPrices();
    notifyListeners();
  }

  Future<double?> calcGain(int gain) async {

    final prefs = await SharedPreferences.getInstance();

    if (gain <= 1) {
      _totalGains += registerPrices[0].price!;
      await prefs.setDouble('double', _totalGains);
    } else if (gain > 2 && gain <= 4) {
      _totalGains += registerPrices[1]
          .price!;
      await prefs.setDouble('double', _totalGains);
    } else if (gain > 4 && gain <= 8) {
      _totalGains += registerPrices[2]
          .price!;
      await prefs.setDouble('double', _totalGains);
    } else if (gain > 8){
      _totalGains += registerPrices[3]
          .price!;
      await prefs.setDouble('double', _totalGains);
    }
    notifyListeners();
      return null;
  }

  getPrice(int gain) {

    if (gain < 1) {
      return registerPrices[0].price;
    } else if (gain > 2 && gain <= 4) {
      return registerPrices[1].price;
    } else if (gain > 4 && gain <= 8) {
      return registerPrices[2].price;
    } else if (gain > 8){
      return registerPrices[3].price;
    }
    notifyListeners();
      return 0.0;
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _totalGains = prefs.getDouble('double') ?? 0;
    notifyListeners();
  }
}