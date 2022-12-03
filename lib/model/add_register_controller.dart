import 'dart:io';

class Register {

  int? id;
  final String driverName;
  final String licensePlate;
  final DateTime entryDate;
  final File? photo;

  Register({this.id, required this.driverName,
    required this.licensePlate,
    required this.entryDate,
    this.photo,});

  factory Register.fromMap(Map<String, dynamic> json) =>
      Register(
        id: json['id'],
        driverName: json['driverName'],
          licensePlate: json['licensePlate'],
          entryDate: json['entryDate']
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'driverName': driverName,
      'licensePlate': licensePlate,
      'entryDate': entryDate.toString()
    };
  }


  @override
  String toString() {
    return 'Register(id: $id, drivername: $driverName, licensePlate: $licensePlate, entryDate: $entryDate)';
  }
}