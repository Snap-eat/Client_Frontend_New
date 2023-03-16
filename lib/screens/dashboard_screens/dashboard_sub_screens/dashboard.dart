// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, avoid_print, file_names, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/utils/custom_tabbar_widget.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigation_routes.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_bottom_sheet.dart';
import '../../../utils/custom_text_fields.dart';
import '../dashboard_floting_bottom_sheet/initial_bottom_sheet.dart';
import '../filter_data_sub_screen_list/filter_data_main_screen.dart';
import 'restaurants_home_screen.dart';

bool showEat = false;

class dashboard extends StatefulWidget {
  const dashboard({super.key});
  @override
  State<dashboard> createState() => dashboardState();
}

class dashboardState extends State<dashboard> {
  var serchController = TextEditingController();
  int currentIndex = 1;

  var lst = [
    restaurants,
    home_cooked,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: h * 0.015,
          ),
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: h * 0.038,
                              backgroundImage: const AssetImage(userImage)),
                          SizedBox(
                            width: w * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AlegreyaText(
                                  "Hello there", black, FontWeight.normal, 20),
                              Row(
                                children: [
                                  AlegreyaText("Elizabath ", primary1,
                                      FontWeight.normal, 20),
                                  Image.asset(thumbIcon)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          notification,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),

                // call to custom tabbar
                customTabbarWith2Tabs(
                  10,
                  () {
                    currentIndex = 1;
                    setState(() {});
                  },
                  h * 0.045,
                  w * 0.3,
                  currentIndex == 1 ? primary1 : transparent,
                  currentIndex == 1 ? white : transparent,
                  IBMPlexsansText(restaurants,
                      currentIndex == 1 ? white : black80, FontWeight.w500, 14),
                  () {
                    currentIndex = 2;
                    showEat = true;
                    showCustomBottomSeet(intial_bottom_sheet());
                    setState(() {});
                  },
                  h * 0.045,
                  w * 0.3,
                  currentIndex == 2 ? primary1 : transparent,
                  currentIndex == 2 ? white : transparent,
                  IBMPlexsansText(home_cooked,
                      currentIndex == 2 ? white : black80, FontWeight.w500, 14),
                ),
                SizedBox(
                  height: h * 0.02,
                ),

                // call to search text form field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: searchTextField(
                      SvgPicture.asset(
                        searchIcon,
                      ),
                      search,
                      TextStyle(color: black, fontSize: 18),
                      TextStyle(color: grey90, fontSize: 15), () {
                    pushTo(
                        const filter_data_main_screen()); // Navigate to filter data screen
                  },
                      SvgPicture.asset(
                        filterIcon,
                      ),
                      serchController),
                ),
                SizedBox(
                  height: h * 0.020,
                ),
                currentIndex == 0
                    ? const restaurants_home_screen() // call to restaurants screen
                    : const restaurants_home_screen(), // call to restaurants screen
              ]),
        ),
      ),
    );
  }
}
