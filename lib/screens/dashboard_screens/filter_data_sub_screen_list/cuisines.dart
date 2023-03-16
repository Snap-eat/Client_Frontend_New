// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, prefer_typing_uninitialized_variables, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_style.dart';

class cuisines extends StatefulWidget {
  const cuisines({super.key});

  @override
  State<cuisines> createState() => cuisinesState();
}

class cuisinesState extends State<cuisines> {
  List cuisine = [
    {"title": "Pizza", "subtitle": "(20)"},
    {"title": "Indian", "subtitle": "(54)"},
    {"title": "Americain", "subtitle": "(49)"},
    {"title": "Domiswsqwsqwnos", "subtitle": "(33)"},
    {"title": "HemBurg", "subtitle": "(87)"},
  ];
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 1,
      // color: kprilightClr,
      child: Wrap(
          children: List.generate(
              cuisine.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: FittedBox(
                      child: Container(
                        height: h * 0.055,
                        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                        margin: EdgeInsets.only(right: w * 0.03, bottom: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: grey.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                            color: currentIndex == index
                                ? primary1
                                : white.withOpacity(0.2)),
                        child: Row(children: [
                          IBMPlexsansText(
                              cuisine[index]['title'].toString(),
                              currentIndex == index ? white : black80,
                              FontWeight.w500,
                              13),
                          IBMPlexsansText(
                              cuisine[index]['subtitle'].toString(),
                              currentIndex == index
                                  ? white.withOpacity(0.6)
                                  : grey90,
                              FontWeight.w500,
                              13),
                        ]),
                      ),
                    ),
                  ))),
    );
  }
}
