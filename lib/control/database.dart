// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:final_project/model/price_model.dart';
import 'package:sqflite/sqflite.dart';
import '../model/register_model.dart';

class DatabaseHelper {
  Database? _db;
  final String tableStay = 'stay';
  final String tablePrices = 'price';
  final String columnIdStay = 'id';
  final String columnIdPrices = 'id';
  final String columnDriverName = 'driverName';
  final String columnLicensePlate = 'licensePlate';
  final String columnEntryDate = 'entryDate';
  final String columnExitDate = 'exitDate';
  final String columnPhoto = 'photo';
  final String columnPrices = 'price';

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbName = 'parking.db';
    final path = join(dbpath, dbName);

    _db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return _db!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tableStay(
      $columnIdStay INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnDriverName TEXT,
      $columnLicensePlate TEXT,
      $columnEntryDate TEXT,
      $columnExitDate TEXT,
      $columnPhoto TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tablePrices(
      $columnIdPrices INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnPrices REAL
    )
    ''');

    Price price1 = Price(id: null, price: 4.00);
    Price price2 = Price(id: null, price: 3.75);
    Price price3 = Price(id: null, price: 3.50);
    Price price4 = Price(id: null, price: 8.00);

    await db.insert(
      tablePrices,
      price1.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      tablePrices,
      price2.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      tablePrices,
      price3.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await db.insert(
      tablePrices,
      price4.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<void> insertRegister(Register stay) async {
    final db = await database;
    await db.insert(
      tableStay,
      stay.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<void> delete(Register stay) async {
    final db = await database;
    await db.delete(tableStay, where: 'id == ?', whereArgs: [stay.id]);
  }

  Future<void> update(Register stay) async {
    final db = await database;

    final query = '''
      UPDATE $tableStay
      SET $columnExitDate = ?
      WHERE $columnIdStay = ?
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
      tableStay,
      where: '$columnExitDate IS NULL',
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
      tableStay,
      where: '$columnExitDate IS NOT NULL',
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
            it['exitDate'],
          ),
        ),
      );
    }
    return register;
  }

  Future<List<Price>> getRegistersPrices() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query(
      tablePrices,
    );

    final registerPrices = <Price>[];

    for (final it in items) {
      registerPrices.add(
        Price(
          id: it['id'],
          price: it['price']
          ),
      );
    }
    return registerPrices;
  }
}
