// custom App Bar
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../component/navigator_key.dart';
import '../component/text_style.dart';
import 'colors.dart';

customAppBar(String txt, [List<Widget>? actions]) {
  return AppBar(
    backgroundColor: white,
    elevation: 0,
    iconTheme: const IconThemeData(color: black),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(navigation_service.navigatorKey.currentContext!);
      },
      child: Icon(
        Icons.arrow_back_ios_rounded,
        size: 22,
        color: black,
      ),
    ),
    title: AlegreyaText(txt, black, FontWeight.w500, 21),
    actions: actions,
  );
}
