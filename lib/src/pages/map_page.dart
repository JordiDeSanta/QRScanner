import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrscanner/src/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition _initialPoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(scan.value),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
