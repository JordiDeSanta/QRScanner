import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:qrscanner/src/models/scan_model.dart';
import 'package:qrscanner/src/pages/directions_page.dart';
import 'package:qrscanner/src/pages/maps_page.dart';
import 'package:qrscanner/src/providers/db_provider.dart';
import 'package:qrscanner/src/providers/ui_state.dart';
import 'package:qrscanner/src/widgets/custom_navbar.dart';
import 'package:qrscanner/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color.fromRGBO(52, 54, 101, 0.0),
    ));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {},
          ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiState = Provider.of<UiProvider>(context);

    int currentIndex = uiState.selectedMenuOpt;

    final tempScan = new ScanModel(value: 'http://google.com');
    DBProvider.db.getScanByID(2).then((scan) => print(scan.value));

    switch (currentIndex) {
      case 0:
        return MapsPage();
        break;
      case 1:
        return DirectionsPage();
        break;
      default:
        return MapsPage();
    }
  }
}
