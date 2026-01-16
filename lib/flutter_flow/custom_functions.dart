import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getGreeting() {
  // Get the current time from the user's device.
  final hour = DateTime.now().hour;

  // Determine the greeting based on the time of day.
  // 0-11 is Morning
  // 12-16 is Afternoon
  // 17-23 is Evening
  if (hour < 12) {
    return 'Good morning,';
  } else if (hour < 17) {
    return 'Good afternoon,';
  } else {
    return 'Good evening,';
  }
}
