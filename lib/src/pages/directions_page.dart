import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qrscanner/src/providers/scan_list_provider.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScanById(scans[i].id);
        },
        background: Container(
          color: Colors.red[400],
        ),
        key: UniqueKey(),
        child: ListTile(
          leading: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].value),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
          onTap: () => print(scans[i].id),
        ),
      ),
    );
  }
}
