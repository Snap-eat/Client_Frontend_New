// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_style.dart';
import '../../../../utils/app_bar_widgets.dart';
import 'dishes_screen.dart';
import 'restaurants_screen.dart';

List images = [
  {
    "image": "assets/images/image1.jpeg",
  },
  {"image": "assets/images/image2.jpeg"},
  {"image": "assets/images/image4.jpeg"},
  {"image": "assets/images/image3.jpeg"},
  {"image": "assets/images/image4.jpeg"}
];

class my_favorites_main_page extends StatefulWidget {
  const my_favorites_main_page({super.key});

  @override
  State<my_favorites_main_page> createState() => my_favorites_main_pageState();
}

class my_favorites_main_pageState extends State<my_favorites_main_page> {
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar(""),
      body: Padding(
        padding: EdgeInsets.only(left: w * 0.05, right: w * 0.07),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AlegreyaText(MY_FAVOURITES, black80, FontWeight.w500, 30),
          Container(
            alignment: Alignment.center,
            height: h * 0.055,
            margin: EdgeInsets.only(top: h * 0.025),
            decoration: BoxDecoration(
              color: black40,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    curentIndex = 0;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
                    alignment: Alignment.center,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                      color: curentIndex == 0 ? primary1 : transparent,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                        width: 1.5,
                        color: curentIndex == 0 ? white : transparent,
                      ),
                      // boxShadow: [BoxShadow(color: greyClr, blurRadius: 10)]
                    ),
                    child: IBMPlexsansText(
                        restaurants,
                        curentIndex == 0 ? white : black80,
                        FontWeight.bold,
                        14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: w * 0.02, right: w * 0.02),
                  height: h * 0.03,
                  width: 1,
                  color: white,
                ),
                GestureDetector(
                  onTap: () {
                    curentIndex = 1;

                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
                    alignment: Alignment.center,
                    height: h * 0.06,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                      color: curentIndex == 1 ? primary1 : transparent,
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                        width: 1.5,
                        color: curentIndex == 1 ? white : transparent,
                      ),
                    ),
                    child: IBMPlexsansText(
                        dishes,
                        curentIndex == 1 ? white : black80,
                        FontWeight.bold,
                        14),
                  ),
                ),
              ],
            ),
          ),
          curentIndex == 0
              ? Expanded(
                  child: restaurants_screen()) // call to  RestaurantsScreen
              : curentIndex == 1
                  ? Expanded(child: dishes_screen()) //  call to DishesScreen
                  : Container()
        ]),
      ),
    );
  }
}
