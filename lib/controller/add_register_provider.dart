import 'dart:io';
<<<<<<< HEAD

import 'package:final_project/controller/database.dart';
import 'package:final_project/model/add_register_model.dart';
import 'package:flutter/material.dart';

=======

import 'package:final_project/database.dart';
import 'package:final_project/model/add_register_controller.dart';
import 'package:flutter/material.dart';

>>>>>>> main
class AddRegisterProvider with ChangeNotifier {
  AddRegisterProvider() {
    getRegisters();
  }

  bool? _loading;
<<<<<<< HEAD

  List<Register> registerDatabase = [];

  bool? get loading => _loading;

  Future<void> addPhoto(File? photo) async {
    registerDatabase.add(Register(photo: photo));
    notifyListeners();
  }

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
=======
  List<Register> registers = [];

  List<Register> registerDatabase = [];

  bool? get loading => _loading;

  addRegister(String name, String plate, DateTime date, File? photo) {
    registers.add(
>>>>>>> main
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

<<<<<<< HEAD
  Future<void> addRow(
      String name,
      String plate,
      DateTime date,
      ) async {
    var db = DatabaseHelper();
    db.insert(
      Register(driverName: name, licensePlate: plate, entryDate: date,),
    );
    notifyListeners();
  }
}
=======
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
>>>>>>> main
