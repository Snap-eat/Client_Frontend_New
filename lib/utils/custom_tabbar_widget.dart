// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/utils/colors.dart';

// custom Tabbar for home And Filter screen

Widget customTabbarWith2Tabs(
  double? elevation,
  Function()? onTap1,
  double height1,
  double width1,
  Color bgcolor1,
  Color borderColor1,
  Widget? child1,
  Function()? onTap2,
  double height2,
  double width2,
  Color bgcolor2,
  Color borderColor2,
  Widget? child2,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Card(
        color: grey,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap1,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                  alignment: Alignment.center,
                  height: height1,
                  width: width1,
                  decoration: BoxDecoration(
                    color: bgcolor1,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      width: 1.5,
                      color: borderColor1,
                    ),
                  ),
                  child: child1),
            ),
            Container(
              margin: EdgeInsets.only(left: w * 0.02, right: w * 0.02),
              height: h * 0.03,
              width: 1,
              color: white,
            ),
            GestureDetector(
              onTap: onTap2,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.0),
                  alignment: Alignment.center,
                  height: height2,
                  width: width2,
                  decoration: BoxDecoration(
                    color: bgcolor2,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(width: 1.5, color: borderColor2),
                  ),
                  child: child2),
            ),
          ],
        ),
      ),
    ],
  );
}

//  create custom Tabbar  for multitabs
Widget customTabbarWithMultiTabs(
    double? elevation, double? tabbarHeight, List<Widget> children) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Card(
        elevation: elevation,
        color: black40,
        margin: EdgeInsets.only(
          left: w * 0.045,
          right: w * 0.04,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: SizedBox(
            height: tabbarHeight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children)),
      ),
    ],
  );
}

//  custom  filter tap   Icon button

Widget FilterTapButton(Function()? onTap, String assetName, Color color,
    Color bcolor, Color imagecolor1) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: bcolor)),
      child: SvgPicture.asset(
        assetName,
        height: h * 0.033,
        color: imagecolor1,
      ),
    ),
  );
}
