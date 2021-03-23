import 'package:flutter/material.dart';
import 'package:qrscanner/src/widgets/scan_list.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanList(type: 'http');
  }
}
