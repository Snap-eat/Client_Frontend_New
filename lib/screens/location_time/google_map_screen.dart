// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, prefer_typing_uninitialized_variables, unused_element, prefer_collection_literals, prefer_final_fields, unused_local_variable, prefer_const_constructors, depend_on_referenced_packages, duplicate_import, camel_case_types, null_argument_to_non_null_type, file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../services/google_map_services/google_map_permissions.dart';

class google_map_screen extends StatefulWidget {
  const google_map_screen({
    Key? key,
  }) : super(key: key);

  @override
  State<google_map_screen> createState() => google_map_screenState();
}

class google_map_screenState extends State<google_map_screen> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14.0);
  final Mode mode = Mode.fullscreen;

  @override
  void initState() {
    getLocation();
    setState(() {});
    super.initState();
  }

  getLocation() async {
    Position position = await determinePosition();
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 30,
            target: LatLng(position.latitude, position.longitude),
            zoom: 14)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          scrollGesturesEnabled: true,
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          markers: _markers,
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
          onCameraMove: (CameraPosition cameraPositiona) {
            initialCameraPosition = cameraPositiona;
          },
          onCameraIdle: () async {}),
    );
  }
}
