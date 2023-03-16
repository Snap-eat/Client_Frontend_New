// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../utils/custom_buttons.dart';

class exclusive_offer extends StatefulWidget {
  int index;

  exclusive_offer({super.key, required this.index});

  @override
  State<exclusive_offer> createState() => exclusive_offerState();
}

class exclusive_offerState extends State<exclusive_offer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: h * 0.02,
                        bottom: h * 0.01,
                        left: w * 0.045,
                        right: w * 0.045),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: grey, blurRadius: 5)]),
                    child: Column(
                      children: [
                        Image.asset(
                          bacgroundImage,
                          fit: BoxFit.cover,
                          width: w * 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w * 0.03,
                              right: w * 0.03,
                              bottom: h * 0.015,
                              top: h * 0.02),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AlegreyaText(RESTAURANTS_LE_PARIS, black,
                                    FontWeight.bold, 19),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IBMPlexsansText(VALID_UNTIL, black30,
                                            FontWeight.bold, 12),
                                        IBMPlexsansText("10-Jan-20", black,
                                            FontWeight.bold, 12),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: w * 0.02, right: w * 0.02),
                                          width: 1,
                                          height: 30,
                                          color: grey,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IBMPlexsansText(VALID_ON, black30,
                                                FontWeight.bold, 12),
                                            IBMPlexsansText("Mon - Wed 12-4pm",
                                                black, FontWeight.bold, 12),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: w * 0.02, right: w * 0.02),
                                          width: 1,
                                          height: 30,
                                          color: grey,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IBMPlexsansText(SERVICES, black30,
                                                FontWeight.bold, 12),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  eatIcon,
                                                  height: 15,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: SvgPicture.asset(
                                                    bikeIcon,
                                                    height: 14,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  bagIcon,
                                                  height: 15,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                IBMPlexsansText(NOT_VALID_WITH_ANY_OTHER,
                                    orange, FontWeight.normal, 12),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customBtn(h * 0.055, () {}, primary1,
                                        VIEW_RESTAURANTS, 14),
                                    SizedBox(
                                      width: w * 0.05,
                                    ),
                                    customBtn(
                                        h * 0.055,
                                        () {},
                                        orange,
                                        widget.index == 3
                                            ? MAKE_A_RESERVATION
                                            : VIEW_MENU_ORDER,
                                        14),
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  IBMPlexsansText(EXCLUSIVE_FOR_SNAP_CONNOISSEURS, grey90,
                      FontWeight.normal, 12)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.16, right: w * 0.07),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(offerImage)),
              ),
            ],
          );
        });
  }
}
