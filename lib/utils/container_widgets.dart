// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../component/images_constant.dart';
import '../component/text_constant_key.dart';

// custom Container  for  Gift & Corporate cards Screen
customContainer(List<Widget> children, String changeText, Function()? onTap) {
  return Container(
    padding: EdgeInsets.all(h * 0.015),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: grey.withOpacity(0.5))),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: children),
      AlegreyaText(changeText, black80, FontWeight.normal, 17),
      GestureDetector(
          onTap: onTap,
          child: IBMPlexsansText(CHANGE, primary, FontWeight.bold, 14)),
    ]),
  );
}

// custom Container widgets for leaderbord screen
customVictoryContainer(
  String euro,
  String name,
  String ponts,
  String userpic,
  String imageUrl,
  String medalurl,
) {
  return Container(
    width: w * 0.3,
    child: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 12),
          width: w * 0.26,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: grey, blurRadius: 10)],
              borderRadius: BorderRadius.circular(10),
              color: white),
          child: Column(children: [
            SizedBox(
              height: h * 0.015,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(userpic),
                ),
                Container(
                    margin: EdgeInsets.only(top: 42),
                    padding: EdgeInsets.symmetric(),
                    height: h * 0.03,
                    decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: white)),
                    child: AlegreyaText(euro, white, FontWeight.w500, 16)),
              ],
            ),
            SizedBox(
              height: h * 0.01,
            ),
            IBMPlexsansText(
                name, black80.withOpacity(0.7), FontWeight.w700, 12),
            Container(
              height: h * 0.033,
              margin: EdgeInsets.only(
                  left: w * 0.04, right: w * 0.04, top: h * 0.01),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: orange, width: 0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    goldenM,
                    height: h * 0.02,
                  ),
                  IBMPlexsansText(ponts, orange, FontWeight.w500, 12)
                ],
              ),
            ),
            Image.asset(
              imageUrl,
              height: h * 0.06,
            )
          ]),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              medalurl,
              height: 30,
            ))
      ],
    ),
  );
}

//  Create a Containar for draw a  Vertical Line  in tabbar

verticalLine() {
  return Container(
    margin: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
    height: 30,
    width: 1,
    color: white,
  );
}
