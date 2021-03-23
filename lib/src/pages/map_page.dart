import 'package:flutter/material.dart';
import 'package:qrscanner/src/models/scan_model.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(scan.value),
      ),
    );
  }
}
