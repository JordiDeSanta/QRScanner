import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrscanner/src/providers/ui_state.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiState = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      currentIndex: uiState.selectedMenuOpt,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Directions',
        ),
      ],
    );
  }
}
