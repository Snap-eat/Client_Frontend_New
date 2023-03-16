// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../component/text_style.dart';
import 'colors.dart';

// custom defalut Scroll wheel list
customWheelScroll(double h, double w, List<Widget> children) {
  return SizedBox(
      height: h * 0.33,
      width: w * 0.14,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        diameterRatio: 1.4,
        physics: FixedExtentScrollPhysics(),
        overAndUnderCenterOpacity: 0.4,
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List.generate(24,
              (index) => IBMPlexsansText("$index", black, FontWeight.bold, 20)),
        ),
        onSelectedItemChanged: (index) {},
      ));
}
