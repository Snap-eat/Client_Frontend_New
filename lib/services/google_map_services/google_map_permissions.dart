// ignore_for_file: file_names, non_constant_identifier_names, unused_element, prefer_const_declarations, prefer_collection_literals
import 'dart:async';
import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied');
  }
  Position position = await Geolocator.getCurrentPosition();

  return position;
}

// Drop Pin On Exact Location

String kGoogleApiKey =
    'AIzaSyDqcutfIh2MTB8Bheg2ExCqGoSELwfhvew'; // Google Api key
