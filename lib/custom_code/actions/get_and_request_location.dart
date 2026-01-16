// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:geolocator/geolocator.dart';

Future<LatLng> getAndRequestLocation() async {
  // Check if location services are enabled.
  bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isLocationServiceEnabled) {
    // Location services are not enabled, return a default location.
    // You can also throw an exception or handle this case as needed.
    return LatLng(0, 0);
  }

  // Check for location permissions.
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Permissions are denied, so request them.
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are still denied, return a default location.
      return LatLng(0, 0);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are permanently denied, we cannot request permissions.
    // You might want to show a dialog to the user to manually enable permissions.
    return LatLng(0, 0);
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  return LatLng(position.latitude, position.longitude);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
