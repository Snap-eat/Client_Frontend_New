// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:snapeat1/utils/colors.dart';
import '../component/navigator_key.dart';
import '../component/text_style.dart';

//// custom Range Slider
customSlider(
    double minvValue,
    double maxValue,
    double startValue,
    double endValue,
    Function(RangeValues)? onChanged,
    String txt1,
    String txt2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SliderTheme(
        data: SliderThemeData(
            // trackShape: CustomTrackShape(),
            overlayShape: SliderComponentShape.noThumb),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: RangeSlider(
              activeColor: primary1,
              min: minvValue,
              max: maxValue,
              values: RangeValues(startValue, endValue),
              onChanged: onChanged),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IBMPlexsansText(txt1, grey90, FontWeight.w500, 15),
          IBMPlexsansText(txt2, grey90, FontWeight.w500, 15),
        ],
      ),
    ],
  );
}

// Slider value button   for Slider use
sliderValueButton(List<Widget> children) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: grey, blurRadius: 8)],
        color: white),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: children),
  );
}

// Custom Siwth button // togle button // flutter Switch fot filter data Screen
customSwitch(String txt1, String txt2, bool value, Function(bool) onToggle,
    [Color? color]) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 12, top: 12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            IBMPlexsansText(txt1, black80, FontWeight.w500, 15),
            IBMPlexsansText(txt2, grey90, FontWeight.w500, 15),
          ]),
          FlutterSwitch(
              width: 42.0,
              height: 20.0,
              activeColor: primary1,
              inactiveColor: grey90,
              valueFontSize: 0.0,
              toggleSize: 16.0,
              value: value,
              borderRadius: 40.0,
              padding: 2,
              onToggle: onToggle),
        ]),
      ),
      Divider(
        color: color,
        thickness: 1.2,
      )
    ],
  );
}

// flutter Switch fot filter data Screen
flutterSwitch(bool value, Function(bool) ontagle) {
  return FlutterSwitch(
      width: 42.0,
      height: 20.0,
      activeColor: primary1,
      inactiveColor: grey90,
      valueFontSize: 0.0,
      toggleSize: 16.0,
      value: value,
      borderRadius: 40.0,
      padding: 2,
      onToggle: ontagle);
}
