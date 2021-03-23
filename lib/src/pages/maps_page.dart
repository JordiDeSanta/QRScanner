import 'package:flutter/material.dart';
import 'package:qrscanner/src/widgets/scan_list.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanList(type: 'geo');
  }
}
