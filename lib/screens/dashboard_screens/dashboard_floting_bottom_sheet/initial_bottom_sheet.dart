// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables, override_on_non_overriding_member, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/custom_bottom_sheet.dart';
import '../../../utils/custom_tabbar_widget.dart';
import '../dashboard_sub_screens/dashboard.dart';
import 'deliver_time_bottom_sheet.dart';

class intial_bottom_sheet extends StatefulWidget {
  const intial_bottom_sheet({super.key});

  @override
  State<intial_bottom_sheet> createState() => intial_bottom_sheetState();
}

class intial_bottom_sheetState extends State<intial_bottom_sheet> {
  int selectedIndex = 0;
  int? index;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          return SizedBox(
            width: width,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Positioned(
                  top: h * 0.02,
                  left: w * 0.045,
                  bottom: -height * 0.83,
                  right: w * 0.045,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: primary1,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: h * 0.135),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IBMPlexsansText(
                                  ChooseService, white, FontWeight.bold, 15),
                              SizedBox(
                                height: h * 0.01,
                              ),

                              // call to customTabbarWith2Tabs
                              customTabbarWith2Tabs(
                                10,
                                () {
                                  selectedIndex = 0;
                                  setState(() {});
                                },
                                h * 0.045,
                                w * 0.27,
                                selectedIndex == 0 ? primary1 : transparent,
                                selectedIndex == 0 ? white : transparent,
                                IBMPlexsansText(
                                    ASAP,
                                    selectedIndex == 0 ? white : black80,
                                    FontWeight.w500,
                                    14),
                                () {
                                  selectedIndex = 1;
                                  showCustomBottomSeet(
                                      deliver_time_bottom_sheet());
                                  setState(() {});
                                },
                                h * 0.045,
                                w * 0.27,
                                selectedIndex == 1 ? primary1 : transparent,
                                selectedIndex == 1 ? white : transparent,
                                IBMPlexsansText(
                                    forLater,
                                    selectedIndex == 1 ? white : black80,
                                    FontWeight.w500,
                                    14),
                              ),

                              SizedBox(
                                height: h * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      FilterTapButton(() {
                                        index = 0;
                                        setState(() {});
                                      },
                                          bikeIcon,
                                          index == 0 ? orange : white,
                                          index == 0 ? orange : grey,
                                          index == 0 ? white : orange),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      IBMPlexsansText(
                                          delivery, white, FontWeight.bold, 12)
                                    ],
                                  ),
                                  showEat == true
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: w * 0.05, right: w * 0.05))
                                      : Column(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: w * 0.1,
                                                    right: w * 0.1),
                                                child: FilterTapButton(() {
                                                  index = 1;
                                                  setState(() {});
                                                },
                                                    eatIcon,
                                                    index == 1 ? orange : white,
                                                    index == 1 ? orange : grey,
                                                    index == 1
                                                        ? white
                                                        : orange)),
                                            SizedBox(
                                              height: h * 0.01,
                                            ),
                                            IBMPlexsansText(eatout, white,
                                                FontWeight.bold, 12)
                                          ],
                                        ),
                                  Column(
                                    children: [
                                      FilterTapButton(() {
                                        index = 2;
                                        setState(() {});
                                      },
                                          bagIcon,
                                          index == 2 ? orange : white,
                                          index == 2 ? orange : grey,
                                          index == 2 ? white : orange),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      IBMPlexsansText(collection, white,
                                          FontWeight.bold, 12)
                                    ],
                                  )
                                ],
                              )
                            ]),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
