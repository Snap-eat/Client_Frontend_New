// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';

import '../../../component/navigator_key.dart';
import '../../../component/text_style.dart';

class dietary extends StatefulWidget {
  const dietary({super.key});

  @override
  State<dietary> createState() => dietaryState();
}

class dietaryState extends State<dietary> {
  List dietary = [
    {"title": "Peanuts", "images": "assets/pin (1).png"},
    {"title": "Nuts", "images": "assets/pin (1).png"},
    {"title": "Fish", "images": "assets/pin (1).png"},
    {"title": "Milk", "images": "assets/pin (1).png"},
    {"title": "Vagetabl", "images": "assets/pin (1).png"},
  ];
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w * 1,
      child: Wrap(
        children: List.generate(
            dietary.length,
            (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: FittedBox(
                  child: Container(
                    height: h * 0.05,
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    margin: EdgeInsets.only(right: w * 0.02, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(30),
                        color: currentIndex == index
                            ? primary1
                            : white.withOpacity(0.2)),
                    child: Row(children: [
                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.settings,
                        color: currentIndex == index ? white : greyblack,
                      ),
                      IBMPlexsansText(
                          dietary[index]['title'].toString(),
                          currentIndex == index ? white : greyblack,
                          FontWeight.w500,
                          13),
                    ]),
                  ),
                ))),
      ),
    );
  }
}
