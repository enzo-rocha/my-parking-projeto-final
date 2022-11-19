import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRegisterProvider with ChangeNotifier {
  List<Register> registers = [];

  addRegister(String name, String plate, DateTime date) {
    registers.add(Register(driverName: name, licensePlate: plate, entryDate: date));
    notifyListeners();
  }
}

@immutable
class Register extends StatelessWidget {
  Register({required this.driverName, required this.licensePlate, required this.entryDate, Key? key})
      : super(key: key);

  String driverName;
  String licensePlate;
  DateTime entryDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25),
          ),
          width: 100,
          height: 100,
          child: Column(
            children: [Text(driverName), Text(licensePlate), Text(DateFormat('yyyy-MM-dd HH:mm').format(entryDate))],
          )),
    );
  }
}
