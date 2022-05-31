import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuildMapWidget extends StatelessWidget {
  const BuildMapWidget({
    Key? key,
    required this.cameraPosition,
    required this.mapController,
  }) : super(key: key);
  final CameraPosition cameraPosition;
  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      circles: {
        Circle(
          circleId: const CircleId('currentCircle'),
          center: LatLng(
              cameraPosition.target.latitude, cameraPosition.target.longitude),
          radius: 30,
          fillColor: Colors.blue.withOpacity(0.6),
          strokeColor: Colors.blue.withOpacity(0.3),
        ),
      },
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
    );
  }
}
