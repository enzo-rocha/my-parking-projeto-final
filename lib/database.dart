// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'model/add_register_controller.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _db;
  final String tableName = 'stay';
  final String columnId = 'id';
  final String columnDriverName = 'driverName';
  final String columnLicensePlate = 'licensePlate';
  final String columnEntryDate = 'entryDate';

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
      $columnEntryDate TEXT
    )  
    ''');
  }

  Future<void> insert(Register stay) async {
    final db = await database;
    await db.insert(tableName, stay.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<void> delete(Register stay) async {
    final db = await database;
    await db.delete(tableName, where: 'id == ?', whereArgs: [stay.id]);
  }

  Future<List<Register>> getRegisters() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(tableName, orderBy: 'id DESC');

    return List.generate(items.length, (i) => Register(
        id: items[i]['id'],
        driverName: items[i]['driverName'],
        licensePlate: items[i]['licensePlate'],
        entryDate: DateTime.parse(items[i]['entryDate'])));
  }
}