// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../component/images_constant.dart';
import '../component/navigator_key.dart';
import '../component/text_style.dart';
import 'colors.dart';

/// custom row for How to earn Rewards dialogbox
customRow(String iconurl, String name) {
  return Row(
    children: [
      Image.asset(iconurl),
      SizedBox(
        width: w * 0.02,
      ),
      IBMPlexsansText(name, black50, FontWeight.bold, 12),
      SizedBox(
        width: w * 0.02,
      ),
      Image.asset(
        goldenM,
        height: 15,
      )
    ],
  );
}
