import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/src/providers/scan_list_provider.dart';
import 'package:qrscanner/src/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        final barcodeScanRes = 'geo:-33.530083793948975,-70.58471869585934';

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, newScan);
      },
    );
  }
}
