import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../helpers/location_helper.dart';
import '../widgets/build_map_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.longitude, required this.latitude}) : super(key: key);
  final double longitude;
  final double latitude;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();

  late final CameraPosition _cameraPosition;

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, ()async{
      await LocationHelper.enableLocation();
    });
    _cameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(widget.latitude, widget.longitude),
      tilt: 0.0,
      zoom: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuildMapWidget(
        cameraPosition: _cameraPosition,
        mapController: _mapController,
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _goToMyCurrentLocation,
          child: const Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
