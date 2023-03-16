// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigation_routes.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../prefrences/shared_prefrences.dart';
import '../../../../utils/app_bar_widgets.dart';
import '../../../../utils/custom_list_tile_widgets.dart';
import '../../../onboarding_screens/enter_mobile.dart';
import 'my_details.dart';
import 'saved_address.dart';
import 'wallet.dart';

class profile_main_page extends StatefulWidget {
  const profile_main_page({super.key});

  @override
  State<profile_main_page> createState() => profile_main_pageState();
}

class profile_main_pageState extends State<profile_main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          radius: 40,
          backgroundColor: primary1,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: orange,
            child: CircleAvatar(
                radius: 32,
                child: Image.asset(menuIcon),
                backgroundColor: white),
          ),
        ),
      ),
      appBar: customAppBar(""),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: w * 0.045,
              right: w * 0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AlegreyaText(PROFILE, black, FontWeight.w500, 30),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    customListtile(() {
                      pushTo(my_details()); // call to  MyDetails screen
                    }, MY_DETAILS),
                    Divider(),

                    customListtile(() {}, MY_FOOD_PREFERENCES),
                    Divider(),
                    customListtile(() {
                      pushTo(wallet()); // call to  Wallet screen
                    }, WALLET),
                    Divider(),
                    customListtile(() {
                      pushTo(saved_address()); // call to  SaveAddress screen
                    }, SAVED_ADDRESS),
                    Divider(),
                    customListtile(() {
                      pustAndRemoveUntil(enter_mobile(
                        dialcode: Preference.pref
                            .getString(UserData.DIAL_CODE.toString()),
                        countrycode: Preference.pref
                            .getString(UserData.COUNTRY_CODE.toString()),
                      ));
                      Preference.pref.clear();
                      setState(() {});
                    }, LOG_OUT),
                    Divider(),
                  ],
                ),
                IBMPlexsansText(RETURN_TO_ORDER, primary1, FontWeight.bold, 15)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
