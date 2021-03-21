import 'package:flutter/material.dart';

import 'package:qrscanner/src/models/scan_model.dart';
import 'package:qrscanner/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String value) async {
    final newScan = new ScanModel(value: value);

    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (this.selectedType == newScan.type) {
      this.scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadScansPerType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...scans];
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansPerType(this.selectedType);
    notifyListeners();
  }
}
