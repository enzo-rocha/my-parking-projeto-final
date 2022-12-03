import 'dart:io';

import 'package:final_project/database.dart';
import 'package:final_project/model/add_register_controller.dart';
import 'package:flutter/material.dart';

class AddRegisterProvider with ChangeNotifier {
  AddRegisterProvider() {
    getRegisters();
  }

  bool? _loading;
  List<Register> registers = [];

  List<Register> registerDatabase = [];

  bool? get loading => _loading;

  addRegister(String name, String plate, DateTime date, File? photo) {
    registers.add(
      Register(
        driverName: name,
        licensePlate: plate,
        entryDate: date,
        photo: photo,
      ),
    );
    notifyListeners();
  }

  Future<void> getRegisters() async {
    var db = DatabaseHelper();

    registerDatabase = await db.getRegisters();
    notifyListeners();
  }

  removeRegister(int index) {
    registers.removeAt(index);
    notifyListeners();
  }

  Future<void> removeRow(
    int? id,
    String name,
    String plate,
    DateTime date,
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
    db.insert(
      Register(driverName: name, licensePlate: plate, entryDate: date),
    );
    notifyListeners();
  }
}
