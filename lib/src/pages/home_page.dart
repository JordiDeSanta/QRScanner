import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

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
      body: Center(child: Text('Home Page')),
      bottomNavigationBar: CustomNavBar(),
      floatingActionButton: ScanButton(),
    );
  }
}
