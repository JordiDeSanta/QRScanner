import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:qrscanner/src/models/scan_model.dart';
import 'package:qrscanner/src/pages/directions_page.dart';
import 'package:qrscanner/src/pages/maps_page.dart';
import 'package:qrscanner/src/providers/db_provider.dart';
import 'package:qrscanner/src/providers/scan_list_provider.dart';
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

    final uiState = Provider.of<UiProvider>(context);

    int currentIndex = uiState.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              switch (currentIndex) {
                case 0:
                  // scanListProvider.deleteScansByType('http');
                  break;
                case 1:
                  // scanListProvider.deleteScansByType('geo');
                  break;
                default:
                  // scanListProvider.deleteScansByType('http');
                  break;
              }
            },
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

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansPerType('geo');
        return MapsPage();
        break;
      case 1:
        scanListProvider.loadScansPerType('http');
        return DirectionsPage();
        break;
      default:
        return MapsPage();
    }
  }
}
