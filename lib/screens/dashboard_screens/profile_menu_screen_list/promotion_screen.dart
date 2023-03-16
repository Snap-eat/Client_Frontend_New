// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../utils/app_bar_widgets.dart';

class promotion_screen extends StatefulWidget {
  const promotion_screen({super.key});

  @override
  State<promotion_screen> createState() => promotion_screenState();
}

class promotion_screenState extends State<promotion_screen> {
  var serchController3 = TextEditingController();
  bool showEnterCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: customAppBar(''),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: w * 0.04, right: w * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlegreyaText(PROMOTIONS, black, FontWeight.normal, 30),
                GestureDetector(
                    onTap: () {
                      showEnterCode = true;
                      setState(() {});
                    },
                    child: IBMPlexsansText(
                        ENTER_CODE, primary1, FontWeight.bold, 16)),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          showEnterCode
              ? Padding(
                  padding: EdgeInsets.only(left: w * 0.045, right: w * 0.045),
                  child: TextFormField(
                      maxLength: 7,
                      cursorHeight: 17,
                      onTap: () {},
                      cursorColor: primary_light,
                      decoration: InputDecoration(
                          counterStyle: TextStyle(height: 0, fontSize: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // filled: true,
                          // fillColor: white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 15, 0, 15),
                          hintText: ENTER_PROMO_CODE,
                          hintStyle: TextStyle(color: grey, fontSize: 17))),
                )
              : Container(),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: h * 0.02,
                            bottom: h * 0.01,
                            left: w * 0.045,
                            right: w * 0.045),
                        padding: EdgeInsets.only(
                            top: h * 0.01,
                            left: w * 0.03,
                            right: w * 0.02,
                            bottom: h * 0.015),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [BoxShadow(color: grey, blurRadius: 5)]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 27,
                                      backgroundImage: AssetImage(userImage)),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AlegreyaText(NEXT_ORDER_10_OFF, primary1,
                                          FontWeight.bold, 18),
                                      IBMPlexsansText(
                                          ALL_RESTAURANTS_HOMECHIEFS,
                                          grey90,
                                          FontWeight.bold,
                                          12),
                                    ],
                                  )
                                ],
                              ),
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
                                      IBMPlexsansText("10-Feb-20", black,
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
                                          IBMPlexsansText(SERVICE, black30,
                                              FontWeight.bold, 12),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                eatIcon,
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                              IBMPlexsansText(NOT_VALID_WITH_ANY_OTHER, orange,
                                  FontWeight.normal, 12),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              MaterialButton(
                                height: h * 0.055,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28)),
                                color: primary1,
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    ORDER,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      IBMPlexsansText(
                          EARNED_BY_YOUSSOUF, grey90, FontWeight.normal, 12)
                    ],
                  );
                }),
          )
        ]));
  }
}
