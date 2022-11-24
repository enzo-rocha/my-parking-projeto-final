import 'package:final_project/controller/add_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRegisterProvider with ChangeNotifier {
  List<Register> registers = [];

  addRegister(String name, String plate, DateTime date) {
    registers.add(
      Register(
        driverName: name,
        licensePlate: plate,
        entryDate: date,
      ),
    );
    notifyListeners();
  }
}

class Register extends AddRegisterController {
  Register({required super.driverName, required super.licensePlate, required super.entryDate});

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.indigo, Colors.indigoAccent, Colors.blue],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 350,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Motorista: $driverName',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'PoppinsLight'),
                  ),
                  Text(
                    'Placa do veículo: $licensePlate',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'PoppinsLight'),
                  ),
                  Text(
                    'Entrada: ${DateFormat('yyyy-MM-dd HH:mm').format(entryDate)}',
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'PoppinsLight'),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
