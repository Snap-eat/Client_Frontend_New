//  custom  loder waiting for data
import 'dart:io';
import 'package:flutter/material.dart';
import '../component/navigator_key.dart';
import 'colors.dart';

Container customLoader = Container(
    color: black.withOpacity(0.5),
    height: MediaQuery.of(navigation_service.navigatorKey.currentContext!)
            .size
            .height *
        1,
    width: MediaQuery.of(navigation_service.navigatorKey.currentContext!)
            .size
            .width *
        1,
    child: Center(
        child: CircularProgressIndicator.adaptive(
      backgroundColor: Platform.isIOS ? primary1 : primary,
    )));
