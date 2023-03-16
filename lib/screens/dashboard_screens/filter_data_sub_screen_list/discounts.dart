// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, prefer_typing_uninitialized_variables, unused_label, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../utils/slider_and_switch_widgets.dart';

class discounts extends StatefulWidget {
  const discounts({super.key});

  @override
  State<discounts> createState() => discountsState();
}

class discountsState extends State<discounts> {
  bool isSwitched = false;

  List discount = [
    {"title": "All offers", "value": false},
    {"title": "£ Reward Credits", "value": false},
    {"title": "Buy 1 Get 1 Free", "value": false},
    {"title": "Up to 50% Off", "value": false},
    {"title": "Meal deals", "value": false},
    {"title": "Up to 30% Off", "value": false},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: discount.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              // call to custom switch
              customSwitch(discount[index]['title'].toString(), "(20)",
                  discount[index]['value'], (value) {
                setState(() {
                  discount[index]['value'] = value;
                });
              }, index == discount.length - 1 ? transparent : grey),
            ],
          );
        });
  }
}
