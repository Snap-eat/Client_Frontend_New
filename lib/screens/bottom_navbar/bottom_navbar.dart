// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigator_key.dart';
import '../../../../utils/custom_bottom_sheet.dart';
import '../dashboard_screens/dashboard_floting_bottom_sheet/initial_bottom_sheet.dart';
import '../dashboard_screens/dashboard_floting_bottom_sheet/service_popup_bottom_sheet.dart';
import '../dashboard_screens/dashboard_sub_screens/dashboard.dart';
import '../dashboard_screens/leaderboard_screen_list/leaderboard_screen.dart';
import '../dashboard_screens/my_order_screen/my_order_screen.dart';
import '../dashboard_screens/profile_menu_page/profile_menu_main_page.dart';

class bottom_navbar extends StatefulWidget {
  const bottom_navbar({Key? key}) : super(key: key);
  @override
  State<bottom_navbar> createState() => bottom_navbarState();
}

class bottom_navbarState extends State<bottom_navbar> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1200)).then((_) {
      showCustomBottomSeet(intial_bottom_sheet());
    });
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List dashboardPages = [
      dashboard(), // call to HomePage Screen
      my_order_screen(), // call to MyOrder  Screen
      leaderboard_screen(), // call to LeaderBoard Screen
      profile_menu_main_page() // call to ProfileMenu Screen
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white.withOpacity(0.96),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: h * 0.015),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 75,
            width: 75,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: white),
            child: FloatingActionButton(
              onPressed: () {
                showCustomBottomSeet(
                    service_popup_bottom_sheet()); // call to  ServicePopupBotomSheet
              },
              backgroundColor: primary1,
              elevation: 0,
              child: SvgPicture.asset(
                cameraIcon,
                height: 30,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: white,
        child: Padding(
          padding: EdgeInsets.all(w * 0.04),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: () {
                  currentIndex = 0;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  HomeIcon,
                  color: currentIndex == 0 ? orange : black,
                )),
            GestureDetector(
                onTap: () {
                  currentIndex = 1;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  FileIcon,
                  color: currentIndex == 1 ? orange : black,
                )),
            SizedBox(
              width: w * 0.15,
            ),
            GestureDetector(
                onTap: () {
                  currentIndex = 2;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  LeaderBordeIcon,
                  color: currentIndex == 2 ? orange : black,
                )),
            GestureDetector(
                onTap: () {
                  currentIndex = 3;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  ProfileIcon,
                  color: currentIndex == 3 ? orange : black,
                )),
          ]),
        ),
      ),
      body: dashboardPages.elementAt(currentIndex),
    );
  }
}
