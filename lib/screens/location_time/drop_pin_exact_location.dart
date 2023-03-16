// ignore_for_file: prefer_final_fields, prefer_collection_literals, prefer_interpolation_to_compose_strings, unused_local_variable, avoid_print, prefer_const_constructors, file_names, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'dart:async';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_buttons.dart';
import '../../component/images_constant.dart';
import '../../component/navigator_key.dart';
import '../../component/text_constant_key.dart';
import '../../services/google_map_services/google_map_permissions.dart';
import '../../utils/app_bar_widgets.dart';

class drop_pin_exact_location extends StatefulWidget {
  const drop_pin_exact_location({super.key});
  @override
  State<drop_pin_exact_location> createState() =>
      drop_pin_exact_locationState();
}

class drop_pin_exact_locationState extends State<drop_pin_exact_location> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14.0);
  final Mode mode = Mode.fullscreen;

  var add = '';
  @override
  void initState() {
    getLocation();
    setState(() {});
    super.initState();
  }

// add user current location
  getLocation() async {
    Position position = await determinePosition();
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 30,
            target: LatLng(position.latitude, position.longitude),
            zoom: 16)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(dropPinToExactLocation),
      body: Stack(
        children: [
          // add google map
          GoogleMap(
            trafficEnabled: true,
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
            onCameraMove: (CameraPosition position) async {
              setState(() {
                initialCameraPosition = position;
              });
              final coordinates = Coordinates(
                  initialCameraPosition.target.latitude,
                  initialCameraPosition.target.longitude);
              var addresses = await Geocoder.local
                  .findAddressesFromCoordinates(coordinates);
              add = addresses.first.addressLine.toString();
            },
            onCameraIdle: () async {},
          ),

          Align(
              alignment: Alignment.center,
              child: Center(
                  child: Image.asset(
                dropPin,
                height: 40,
              ))),
          Padding(
            padding: EdgeInsets.all(h * 0.04),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DefaultButtonLogin(
                  width: w * 1,
                  height: h * 0.065,
                  text: Confirm,
                  press: () async {
                    getUserLocationFromDropPin(); // call to  getUserLocationFromDropPin Method
                  },
                  colors: [primary, primary_light]),
            ),
          )
        ],
      ),
    );
  }

//  create functon  get  location from cordinates
  getUserLocationFromDropPin() async {
    final coordinates = Coordinates(initialCameraPosition.target.latitude,
        initialCameraPosition.target.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    return addresses.first;
  }
}
