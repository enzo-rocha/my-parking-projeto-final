// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/add_register_model.dart';

class DatabaseHelper {
  Database? _db;
  final String tableName = 'stay';
  final String columnId = 'id';
  final String columnDriverName = 'driverName';
  final String columnLicensePlate = 'licensePlate';
  final String columnEntryDate = 'entryDate';
  final String columnExitDate = 'exitDate';

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbName = 'parking.db';
    final path = join(dbpath, dbName);

    _db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return _db!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnDriverName TEXT,
      $columnLicensePlate TEXT,
      $columnEntryDate TEXT,
      $columnExitDate TEXT
    )  
    ''');
  }

  Future<void> insert(Register stay) async {
    final db = await database;
    await db.insert(
      tableName,
      stay.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(Register stay) async {
    final db = await database;
    await db.delete(tableName, where: 'id == ?', whereArgs: [stay.id]);
  }

  Future<void> update(Register stay) async {
    final db = await database;

    final query = '''
      UPDATE $tableName 
      SET $columnExitDate = ?
      WHERE $columnId = ?
    ''';

    db.rawUpdate(
      query,
      [
        stay.exitDate.toString(),
        stay.id,
      ],
    );
  }

  Future<List<Register>> getRegisters() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      tableName,
      where: '$columnExitDate IS NULL',
      orderBy: 'id DESC',
    );

    final register = <Register>[];

    for (final it in items) {
      register.add(
        Register(
          id: it['id'],
          driverName: it['driverName'],
          licensePlate: it['licensePlate'],
          entryDate: DateTime.parse(
            it['entryDate'],
          ),
          exitDate: DateTime.parse(
            it['entryDate'],
          ),
        ),
      );
    }
    return register;
  }

  Future<List<Register>> getRegistersNotNull() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      tableName,
      where: '$columnExitDate IS NOT NULL',
      orderBy: 'id DESC',
    );

    final register = <Register>[];

    for (final it in items) {
      register.add(
        Register(
          id: it['id'],
          driverName: it['driverName'],
          licensePlate: it['licensePlate'],
          entryDate: DateTime.parse(
            it['entryDate'],
          ),
          ),

      );
    }

    return register;
  }
}