// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../utils/app_bar_widgets.dart';
import 'all_corporate_cards_screen.dart';

class corporate_cards_main_page extends StatefulWidget {
  const corporate_cards_main_page({super.key});

  @override
  State<corporate_cards_main_page> createState() =>
      corporate_cards_main_pageState();
}

class corporate_cards_main_pageState extends State<corporate_cards_main_page> {
  var list = [
    ALL,
    CELEBRATIONS,
    GIFT,
    CORPORATE,
    FESTIVITIES,
    FOOD_DAYS,
    GENERAL
  ];
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: customAppBar(''),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              left: w * 0.045,
            ),
            child: AlegreyaText(CorporateCards, black, FontWeight.normal, 30),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: w * 0.045),
            alignment: Alignment.center,
            height: h * 0.05,
            decoration: BoxDecoration(
                color: black40,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [BoxShadow(color: grey, blurRadius: 10)]),
            child: SizedBox(
                height: h * 0.05,
                child: ListView.builder(
                    itemCount: list.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectedTab = index;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: w * 0.05, right: w * 0.05),
                              alignment: Alignment.center,
                              // height: h * 0.06,
                              decoration: BoxDecoration(
                                color: selectedTab == index
                                    ? primary1
                                    : transparent,
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(
                                  width: 1.5,
                                  color: selectedTab == index
                                      ? white
                                      : transparent,
                                ),
                              ),
                              child: IBMPlexsansText(
                                  list[index],
                                  selectedTab == index ? white : black80,
                                  FontWeight.bold,
                                  12),
                            ),
                          ),
                          index == list.length - 1
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: w * 0.01, right: w * 0.01),
                                  height: 30,
                                  width: 1,
                                  color: white,
                                )
                        ],
                      );
                    })),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          selectedTab == 0
              ? Expanded(
                  child:
                      all_corporate_cards_screen()) // call to AllCorporateCards screen
              : Container()
        ]));
  }
}
