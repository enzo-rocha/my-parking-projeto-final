import 'package:final_project/controller/database.dart';
import 'package:final_project/model/add_register_model.dart';
import 'package:flutter/material.dart';

class GainsProvider with ChangeNotifier {
  GainsProvider() {
    getRegistersNotNull();
  }

  bool? _loading;

  List<Register> registerDatabaseFinished = [];

  bool? get loading => _loading;

  Future<void> getRegistersNotNull() async {
    var db = DatabaseHelper();
    registerDatabaseFinished = await db.getRegistersNotNull();
    notifyListeners();
  }
}