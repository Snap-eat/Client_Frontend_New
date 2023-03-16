// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../component/images_constant.dart';
import '../../component/navigation_routes.dart';
import '../../component/navigator_key.dart';
import '../../component/text_constant_key.dart';
import '../../component/text_style.dart';
import '../../utils/app_bar_widgets.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/custom_tabbar_widget.dart';
import '../../utils/custom_text_fields.dart';
import '../../utils/dialog_box_widgets.dart';
import '../dashboard_screens/dashboard_floting_bottom_sheet/deliver_time_bottom_sheet.dart';
import 'drop_pin_exact_location.dart';
import 'google_map_screen.dart';

class location_time extends StatefulWidget {
  const location_time({super.key});
  @override
  State<location_time> createState() => location_timeState();
}

class location_timeState extends State<location_time> {
  var serchController1 = TextEditingController();
  int currentIndex = 0;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(LocatioAndTime),
        body: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(height: h * 0.45, child: google_map_screen())),
            Container(
              height: h * 0.6,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: white, blurRadius: 15),
                BoxShadow(color: white, blurRadius: 15)
              ]),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.045,
                    right: w * 0.045,
                    top: h * 0.02,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // call to search text form field
                          searchTextField(
                              SvgPicture.asset(
                                searchIcon,
                              ),
                              newAddress,
                              TextStyle(color: black, fontSize: 17),
                              TextStyle(color: grey90, fontSize: 17),
                              () {},
                              SvgPicture.asset(
                                locationIcon,
                              ),
                              serchController1),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // call to custom button view map
                              customButtonViewMap(() {}, white, primary,
                                  locationIcon, CURRENT_LOCATION, black),
                              customButtonViewMap(() {}, white, primary,
                                  HomeIcon2, AT_HOME, black),
                              customButtonViewMap(() {}, white, primary,
                                  bagIcon, AT_WORK, black),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Column(
                              children: List.generate(
                            3,
                            (index) => Padding(
                              padding: EdgeInsets.only(bottom: h * 0.015),
                              child: GestureDetector(
                                onTap: () {
                                  pushTo(drop_pin_exact_location());

                                  // pushTo(context, DropPinToExactLocation());
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: grey90,
                                    ),
                                    SizedBox(
                                      width: w * 0.03,
                                    ),
                                    IBMPlexsansText(SOHO_LONDON, grey90,
                                        FontWeight.w500, 16)
                                  ],
                                ),
                              ),
                            ),
                          )),
                          Divider(),
                          SizedBox(
                            height: h * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  // call to filter tap button
                                  FilterTapButton(() {
                                    index = 0;
                                    setState(() {});
                                  },
                                      currentIndex == 1 ? bikeIcon : eatIcon,
                                      index == 0 ? primary1 : white,
                                      index == 0 ? primary1 : grey,
                                      index == 0 ? white : orange),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  IBMPlexsansText(
                                      currentIndex == 1 ? delivery : eatout,
                                      grey90,
                                      FontWeight.bold,
                                      12)
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: w * 0.05, right: w * 0.05),
                                      // call to filter tap button
                                      child: FilterTapButton(() {
                                        index = 1;
                                        setState(() {});
                                      },
                                          currentIndex == 1
                                              ? bagIcon
                                              : bikeIcon,
                                          index == 1 ? primary1 : white,
                                          index == 1 ? primary1 : grey,
                                          index == 1 ? white : orange)),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  IBMPlexsansText(
                                      currentIndex == 1 ? collection : delivery,
                                      grey90,
                                      FontWeight.bold,
                                      12)
                                ],
                              ),
                              Column(
                                children: [
                                  // call to filter tap button
                                  FilterTapButton(() {
                                    index = 2;
                                    setState(() {});
                                  },
                                      currentIndex == 1
                                          ? chiefAtHomeIcon
                                          : bagIcon,
                                      index == 2 ? primary1 : white,
                                      index == 2 ? primary1 : grey,
                                      index == 2 ? white : orange),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  IBMPlexsansText(
                                      currentIndex == 1
                                          ? chief_atHome
                                          : collection,
                                      grey90,
                                      FontWeight.bold,
                                      12)
                                ],
                              ),
                              SizedBox(
                                width: w * 0.04,
                              ),
                              Column(
                                children: [
                                  // call to filter tap button

                                  FilterTapButton(() {
                                    index = 3;
                                    setState(() {});
                                  },
                                      chiefAtHomeIcon,
                                      index == 3 ? primary1 : white,
                                      index == 3 ? primary1 : grey,
                                      index == 3 ? white : orange),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  IBMPlexsansText(
                                      chief_atHome, grey90, FontWeight.bold, 12)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: h * 0.026, left: w * 0.005),
                                child: GestureDetector(
                                  onTap: () {
                                    // call to custom dialog box
                                    show_dialog_with_annimation(h * 0.35, [
                                      IBMPlexsansText(
                                          "When you upload a FoodSnap, instead of your first name, we can show your instagram ID as the contributor.  Once your photo has been approved and live on the restaurant’s menu, it will be visible by all SnapEaters. Thus generating traffic to your instagram, especially useful for food/lifestyle bloggers. However, if you wish to remain private, leave this blank. And don’t worry, we will still credit your photo with your first name, profile picture and SnapEat status badge.",
                                          black,
                                          FontWeight.normal,
                                          15),
                                    ]);
                                  },
                                  child: SvgPicture.asset(
                                    thinkIcon,
                                    height: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              showCustomBottomSeet(deliver_time_bottom_sheet());
                            },
                            child: Container(
                              height: h * 0.05,
                              width: index == 0 ? w * 0.42 : w * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: grey)),
                              child: Row(
                                children: [
                                  index == 0
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children: [
                                              Image.asset(manyPerson),
                                              SizedBox(
                                                width: w * 0.01,
                                              ),
                                              IBMPlexsansText("2", black80,
                                                  FontWeight.w500, 17),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_sharp,
                                        color: grey90,
                                      ),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      IBMPlexsansText(
                                          ASAP, black80, FontWeight.w500, 17),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: grey90,
                                        size: 28,
                                      ),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: h * 0.24),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  // call to  custom button view map
                  child: customButtonViewMap(
                      () {}, orange, white, mapviewIcon1, pinOnMap, white)),
            ),
          ],
        ));
  }
}
