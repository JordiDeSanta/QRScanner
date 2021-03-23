import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qrscanner/src/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();

    final path = join(docsDirectory.path, 'ScansDB.db');

    print(path);

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          );
        ''');
      },
    );
  }

  Future<int> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;

    // Verify the DB
    final db = await database;

    final res = await db.rawInsert('''
      INSET INTO Scans(id, type, value)
        VALUES($id, '$type', '$value')
    ''');

    return res;
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toJson());
    print(res);

    // ID of the last
    return res;
  }

  Future<ScanModel> getScanByID(int id) async {
    final db = await database;
    final res = await db.query(
      'Scans',
      where: 'id = ?',
      whereArgs: [id],
    );

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : [];
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : null;
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'
    ''');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.update(
      'Scans',
      newScan.toJson(),
      where: 'id = ?',
      whereArgs: [newScan.id],
    );
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete(
      'Scans',
      where: 'id = ?',
      whereArgs: [id],
    );
    return res;
  }

  Future<int> deleteScansByType(String type) async {
    final db = await database;
    final res = await db.rawDelete('''
      SELECT * FROM Scans WHERE type = '$type'
    ''');
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Scans
    ''');
    return res;
  }
}
