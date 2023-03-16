// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_style.dart';

class atmosphere extends StatefulWidget {
  const atmosphere({super.key});

  @override
  State<atmosphere> createState() => atmosphereState();
}

class atmosphereState extends State<atmosphere> {
  List cuisine = [
    "Dog friendly",
    "Kids friendly",
    "Quite",
    "Laptop friendly",
    "Disable access friendly",
  ];
  int? currentIndex;
  // ignore: prefer_typing_uninitialized_variables
  @override
  Widget build(BuildContext context) {
    return Wrap(
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
                  height: h * 0.05,
                  padding: EdgeInsets.symmetric(horizontal: w * 0.045),
                  margin: EdgeInsets.only(right: w * 0.02, bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(30),
                      color: currentIndex == index
                          ? primary1
                          : white.withOpacity(0.1)),
                  child: IBMPlexsansText(
                      cuisine[index].toString(),
                      currentIndex == index ? white : black90,
                      FontWeight.w500,
                      13),
                ),
              ))),
    );
  }
}
