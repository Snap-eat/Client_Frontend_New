// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class navigation_service {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

//  Height & Width  for MedaiQuery
var h = MediaQuery.of(navigation_service.navigatorKey.currentContext!)
    .size
    .height; // daynamic height  with media Query
var w = MediaQuery.of(navigation_service.navigatorKey.currentContext!)
    .size
    .width; // daynamic width  with media Query


