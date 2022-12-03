import 'dart:io';
import 'package:final_project/model/add_register_controller.dart';
import 'package:flutter/material.dart';


class AddRegisterProvider with ChangeNotifier {
  List<Register> registers = [];

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

  removeRegister(int index) {
    registers.removeAt(index);
    notifyListeners();
  }
}





