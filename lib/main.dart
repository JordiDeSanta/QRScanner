import 'package:flutter/material.dart';
import 'package:qrscanner/src/pages/home_page.dart';
import 'package:qrscanner/src/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
