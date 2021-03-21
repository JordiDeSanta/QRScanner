import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrscanner/src/pages/home_page.dart';
import 'package:qrscanner/src/pages/map_page.dart';
import 'package:qrscanner/src/providers/scan_list_provider.dart';
import 'package:qrscanner/src/providers/ui_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'map': (BuildContext context) => MapPage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(236, 65, 52, 1.0),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(236, 65, 52, 1.0),
          ),
        ),
      ),
    );
  }
}
