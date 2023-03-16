// ignore_for_file: unnecessary_brace_in_string_interps, prefer_final_fields, unused_field, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/screens/dashboard_screens/filter_data_sub_screen_list/review_score.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/custom_list_tile_widgets.dart';
import '../../../utils/custom_tabbar_widget.dart';
import '../../../utils/slider_and_switch_widgets.dart';
import '../leaderboard_screen_list/this_month_onleader_board_screen.dart';
import 'atmosphere.dart';
import 'cuisines.dart';
import 'dietary.dart';
import 'discounts.dart';
import 'reservation_availability_screen.dart';
import 'sort_by.dart';

class filter_data_main_screen extends StatefulWidget {
  const filter_data_main_screen({super.key});

  @override
  State<filter_data_main_screen> createState() =>
      filter_data_main_screenState();
}

class filter_data_main_screenState extends State<filter_data_main_screen> {
  int currentTab = 0;
  int? index;
  int? Index;
  bool togle = false;
  bool togle1 = false;
  bool togle2 = false;
  bool togle3 = false;
  bool togle4 = false;
  bool togle5 = false;
  bool togle6 = false;
  List filterData = [
    {"title": SORT_BY, "value": sort_by()}, // call to SortBy sceen
    {"title": CUISINE, "value": cuisines()}, // call to Cuisines sceen
    {"title": DIETRY, "value": dietary()}, // call to Dietary sceen
    {"title": DISCOUNTS, "value": discounts()}, // call to Discounts sceen
    {
      "title": REVIEW_SCORE,
      "value": review_score()
    } // call to ReviewScore sceen
  ];

  List establish = [
    {
      "title": SORT_BY,
      "image": "assets/icons/vector1.svg",
    },
    {
      "title": CUISINE,
      "image": "assets/icons/vector1.svg",
    },
    {
      "title": DIETRY,
      "image": "assets/icons/vector2.svg",
    },
    {
      "title": DISCOUNTS,
      "image": "assets/icons/vector3.svg",
    },
    {
      "title": REVIEW_SCORE,
      "image": "assets/icons/vector4.svg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: black40,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: w * 0.055,
                  right: w * 0.055,
                  top: h * 0.03,
                  bottom: h * 0.02),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new_rounded)),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AlegreyaText(FILTERS, black, FontWeight.w500, 30),
                      IBMPlexsansText(RESET_FILTERS.toUpperCase(), orange,
                          FontWeight.w600, 14)
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child:
                          AlegreyaText(SERVICES, black, FontWeight.w700, 21)),
                  SizedBox(
                    height: h * 0.02,
                  ),

                  //  call  custom Tabbar
                  customTabbarWith2Tabs(
                    10,
                    () {
                      currentTab = 0;
                      setState(() {});
                    },
                    h * 0.045,
                    w * 0.4,
                    currentTab == 0 ? primary1 : transparent,
                    currentTab == 0 ? white : transparent,
                    IBMPlexsansText(restaurants,
                        currentTab == 0 ? white : black75, FontWeight.w500, 13),
                    () {
                      currentTab = 1;
                      setState(() {});
                    },
                    h * 0.045,
                    w * 0.4,
                    currentTab == 1 ? primary1 : transparent,
                    currentTab == 1 ? white : transparent,
                    IBMPlexsansText(home_cooked,
                        currentTab == 1 ? white : black75, FontWeight.w500, 13),
                  ),
                  SizedBox(
                    height: h * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // call to filter tab button
                          FilterTapButton(() {
                            index = 0;
                            setState(() {});
                          },
                              currentTab == 1 ? bikeIcon : eatIcon,
                              index == 0 ? primary1 : white,
                              index == 0 ? primary1 : grey,
                              index == 0 ? white : orange),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          IBMPlexsansText(currentIndex == 1 ? delivery : eatout,
                              grey90, FontWeight.w500, 13)
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: w * 0.04, right: w * 0.04),
                              // call to filter tab button

                              child: FilterTapButton(() {
                                index = 1;
                                setState(() {});
                              },
                                  currentTab == 1 ? bagIcon : bikeIcon,
                                  index == 1 ? primary1 : white,
                                  index == 1 ? primary1 : grey,
                                  index == 1 ? white : orange)),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          IBMPlexsansText(
                              currentTab == 1 ? collection : delivery,
                              grey90,
                              FontWeight.w500,
                              13)
                        ],
                      ),
                      Column(
                        children: [
                          // call to filter tab button

                          FilterTapButton(() {
                            index = 2;
                            setState(() {});
                          },
                              currentTab == 1 ? chiefAtHomeIcon : bagIcon,
                              index == 2 ? primary1 : white,
                              index == 2 ? primary1 : grey,
                              index == 2 ? white : orange),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          IBMPlexsansText(
                              currentTab == 1 ? chief_atHome : collection,
                              grey90,
                              FontWeight.w500,
                              13)
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    color: grey,
                    thickness: 1.5,
                  ),
                  ListView.builder(
                      itemCount: filterData.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Theme(
                              data: ThemeData(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.zero,
                                childrenPadding: EdgeInsets.zero,
                                title: Align(
                                    alignment: Alignment.topLeft,
                                    child: AlegreyaText(
                                        filterData[index]['title'].toString(),
                                        black,
                                        FontWeight.w700,
                                        21)),
                                children: [filterData[index]['value']],
                              ),
                            ),
                            Container(
                              width: w * 1,
                              height: 1,
                              color: grey,
                            ),
                          ],
                        );
                      }),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: AlegreyaText(
                          Establishment_type, black, FontWeight.w700, 21)),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: establish.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(right: w * 0.03),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Index = index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    width: 60,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: grey),
                                        color:
                                            Index == index ? primary1 : white),
                                    child: SvgPicture.asset(
                                      establish[index]['image'],
                                      color: Index == index ? white : primary1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.005,
                                ),
                                IBMPlexsansText(establish[index]['title'],
                                    grey90, FontWeight.w500, 14)
                              ],
                            ),
                          );
                        }),
                  ),
                  Divider(
                    color: grey,
                    thickness: 1.2,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: AlegreyaText(
                          other_filter, black, FontWeight.w700, 21)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IBMPlexsansText(
                                menu_abailable, orange, FontWeight.w500, 15),
                            Container(
                                height: 30,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: SvgPicture.asset(icon3d)),
                          ],
                        ),

                        // call to flutter switch
                        flutterSwitch(togle, (value) {
                          togle = value;
                          setState(() {});
                        })
                      ],
                    ),
                  ),
                  customDivider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IBMPlexsansText(
                            full_picture, orange, FontWeight.w500, 15),

                        // call to flutter switch
                        flutterSwitch(togle1, (value) {
                          togle1 = value;
                          setState(() {});
                        })
                      ],
                    ),
                  ),
                  customDivider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IBMPlexsansText(
                                top_eat_only, black80, FontWeight.w500, 15),
                            SizedBox(
                              width: w * 0.03,
                            ),
                            Image.asset(
                              victoryIcon,
                              height: 25,
                            ),
                          ],
                        ),
                        // call to flutter switch
                        flutterSwitch(togle2, (value) {
                          togle2 = value;
                          setState(() {});
                        })
                      ],
                    ),
                  ),

                  //  add custom swicth

                  customDivider(),
                  customSwitch(open_now, "", togle3, (value) {
                    togle3 = value;
                    setState(() {});
                  }),
                  //  add custom swicth
                  customSwitch(contact_less, "", togle4, (value) {
                    setState(() {
                      togle4 = value;
                    });
                  }),
                  //  add custom swicth
                  customSwitch(star_review, "", togle5, (value) {
                    setState(() {
                      togle5 = value;
                    });
                  }),
                  //  add custom swicth
                  customSwitch(michelin_star_only, "", togle6, (value) {
                    setState(() {
                      togle6 = value;
                    });
                  }),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.02),
                      child:
                          AlegreyaText(ATMOSPHERE, black, FontWeight.w700, 21),
                    ),
                  ),

                  atmosphere(), // call to  atmoshfare class
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.02),
                      child: AlegreyaText(reservation_availability_text, black,
                          FontWeight.w700, 21),
                    ),
                  ),
                  reservation_availability_screen(), // call to Reservation Availability calss
                ],
              ),
            ),

            // call to  button
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: w * 0.05, right: w * 0.05, bottom: h * 0.05),
                child: MaterialButton(
                    height: h * 0.06,
                    color: primary1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IBMPlexsansText(
                            apply_filter, white, FontWeight.normal, 22),
                        IBMPlexsansText(
                            RESULT_50, white, FontWeight.normal, 18),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
