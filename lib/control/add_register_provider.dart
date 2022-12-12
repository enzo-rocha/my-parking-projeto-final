import 'dart:io';
import 'package:final_project/control/database.dart';
import 'package:final_project/model/register_model.dart';
import 'package:flutter/material.dart';

class AddRegisterProvider with ChangeNotifier {
  AddRegisterProvider() {
    getRegisters();
  }

  bool? _loading;

  List<Register> registerDatabase = [];

  bool? get loading => _loading;

  Future<void> getRegisters() async {
    var db = DatabaseHelper();
    registerDatabase = await db.getRegisters();
    notifyListeners();
  }

  Future<void> removeRow(
      int? id,
      String name,
      String plate,
      DateTime date
      ) async {
    var db = DatabaseHelper();
    await db.update(
      Register(
        id: id,
        driverName: name,
        licensePlate: plate,
        entryDate: date,
        exitDate: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  Future<void> addRow(
      String name,
      String plate,
      DateTime date,
      ) async {
    var db = DatabaseHelper();
    db.insertRegister(
      Register(driverName: name, licensePlate: plate, entryDate: date,),
    );
    notifyListeners();
  }
}