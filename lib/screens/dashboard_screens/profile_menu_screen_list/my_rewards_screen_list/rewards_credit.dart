// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_import, non_constant_identifier_names, unused_local_variable, camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_style.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/custom_buttons.dart';
import '../../../../utils/custom_text_fields.dart';

class rewards_credit extends StatefulWidget {
  int index;
  rewards_credit({super.key, required this.index});

  @override
  State<rewards_credit> createState() => rewards_creditState();
}

class rewards_creditState extends State<rewards_credit> {
  int currentYear = 2023;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.015),
                child: CircleAvatar(
                  backgroundColor: white,
                  radius: h * 0.075,
                  backgroundImage:
                      AssetImage(widget.index == 1 ? nftImage : creditRedim),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "£123",
                          style:
                              GoogleFonts.lusitana(fontSize: 25, color: white),
                        ),
                        Text(CREDIT,
                            style: GoogleFonts.inriaSerif(
                              fontSize: 18,
                              color: white,
                              fontWeight: FontWeight.bold,
                            ))
                      ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customBtn(h * 0.042, () {
                    ShowRedeem(widget.index);
                  }, widget.index == 1 ? skyblue : yellow, REDEEM_NOW, 14)
                ],
              ),
              SizedBox(
                height: h * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (() {
                        currentYear--;
                        setState(() {});
                      }),
                      child: Icon(Icons.arrow_back_ios_outlined)),
                  Container(
                    margin: EdgeInsets.only(
                      left: 7,
                      right: 7,
                    ),
                    height: h * 0.05,
                    width: w * 0.35,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: IBMPlexsansText(
                              "$currentYear", black, FontWeight.bold, 14)),
                    ),
                  ),
                  GestureDetector(
                      onTap: (() {
                        currentYear++;
                        if (currentYear == 2023) {
                          currentYear;
                        }
                        setState(() {});
                      }),
                      child: Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: h * 0.42,
          width: w * 1,
          decoration: BoxDecoration(
              color: white,
              boxShadow: [BoxShadow(color: grey, blurRadius: 15)],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28), topRight: Radius.circular(28))),
          child: Padding(
            padding:
                EdgeInsets.only(left: w * 0.04, right: w * 0.04, top: h * 0.01),
            child: Column(children: [
              AlegreyaText(TRANSACTIONS, black, FontWeight.w500, 25),
              IBMPlexsansText(TRANSACTION_65, grey90, FontWeight.normal, 13),
              SizedBox(
                height: h * 0.01,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IBMPlexsansText(
                              REASON, grey90, FontWeight.normal, 13),
                          Column(
                              children: List.generate(
                                  10,
                                  (index) => Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.005, bottom: h * 0.005),
                                      child: AlegreyaText(REVIEW, black,
                                          FontWeight.w500, 15)))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IBMPlexsansText(DATE, grey90, FontWeight.normal, 13),
                          Column(
                              children: List.generate(
                                  10,
                                  (index) => Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.005, bottom: h * 0.005),
                                      child: AlegreyaText("17.06", black,
                                          FontWeight.w500, 15)))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IBMPlexsansText(TIME, grey90, FontWeight.normal, 13),
                          Column(
                              children: List.generate(
                                  10,
                                  (index) => Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.005, bottom: h * 0.005),
                                      child: AlegreyaText("20:30", black,
                                          FontWeight.w500, 15)))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IBMPlexsansText(
                              ORDER_, grey90, FontWeight.normal, 13),
                          Column(
                              children: List.generate(
                                  10,
                                  (index) => Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.005, bottom: h * 0.005),
                                      child: AlegreyaText("12692", black,
                                          FontWeight.w500, 15)))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IBMPlexsansText(
                              widget.index == 1 ? NFT_COINS : "£ $REWARDS",
                              grey90,
                              FontWeight.normal,
                              13),
                          Column(
                              children: List.generate(
                                  10,
                                  (index) => Padding(
                                      padding: EdgeInsets.only(
                                          top: h * 0.005, bottom: h * 0.005),
                                      child: AlegreyaText(
                                          "£ 5", black, FontWeight.w500, 15)))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}

// show Redeem  Dialog box
ShowRedeem(int index) {
  return showDialog(
      barrierDismissible: true,
      context: navigation_service.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        TextEditingController nameCon = TextEditingController();
        TextEditingController emailCon = TextEditingController();
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: w * 0.03, left: w * 0.03),
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.06),
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(10),
                      child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: h * 0.05,
                            ),
                            AlegreyaText(
                                REDEMPTION, black, FontWeight.w500, 25),
                            Row(
                              children: [
                                Image.asset(STEP_ICON),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                IBMPlexsansText(ENTER_YOUR_SECURE_EMAIL, grey90,
                                    FontWeight.normal, 14),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: w * 0.03, right: w * 0.03),
                                child: searchTextField(
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: w * 0.03, right: w * 0.03),
                                        child: IBMPlexsansText(EMAIL_ADDRESS,
                                            black80, FontWeight.bold, 14)),
                                    ENTER_HERE,
                                    TextStyle(fontSize: 14, color: grey90),
                                    TextStyle(fontSize: 14, color: grey90),
                                    () {},
                                    Text(""),
                                    emailCon)),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Row(
                              children: [
                                Image.asset(STEP_ICON),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                IBMPlexsansText(SENT_SECURITY_CODE_TO_EMAIL,
                                    grey90, FontWeight.normal, 14),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: w * 0.03, right: w * 0.03),
                                child: searchTextField(
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: w * 0.03, right: w * 0.03),
                                        child: IBMPlexsansText(SECURITY_CODE,
                                            black80, FontWeight.bold, 14)),
                                    ENTER_HERE,
                                    TextStyle(fontSize: 14, color: grey90),
                                    TextStyle(fontSize: 14, color: grey90),
                                    () {},
                                    Text(""),
                                    nameCon)),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Row(
                              children: [
                                Image.asset(STEP_ICON),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                IBMPlexsansText(WE_WILL_SEND_GIFT_CODE_VIA,
                                    grey90, FontWeight.normal, 14),
                                Image.asset(binance)
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Row(
                              children: [
                                Image.asset(STEP_ICON),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                IBMPlexsansText(REDEEM_YOUR_GIFT_CARD_VIA,
                                    grey90, FontWeight.normal, 14),
                                Image.asset(binance)
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Row(
                              children: [
                                Image.asset(STEP_ICON),
                                SizedBox(
                                  width: w * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IBMPlexsansText(BROUSE_AND_PURCHASE, grey90,
                                        FontWeight.normal, 14),
                                    Row(
                                      children: [
                                        Image.asset(binance),
                                        IBMPlexsansText(NFT_MARKETPLACE, grey90,
                                            FontWeight.normal, 14),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customBtn(h * 0.042, () {
                                  Navigator.pop(context);
                                  ShowRedeemfinal(index);
                                }, index == 1 ? skyblue : yellow, REDEEM_NOW,
                                    14)
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            IBMPlexsansText(
                                redeemtext, grey90, FontWeight.normal, 10)
                          ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: transparent,
                      radius: h * 0.06,
                      backgroundImage:
                          AssetImage(index == 1 ? nftImage : creditRedim),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "£123",
                              style: GoogleFonts.lusitana(
                                  fontSize: 23, color: white),
                            ),
                            Text(CREDIT,
                                style: GoogleFonts.inriaSerif(
                                  fontSize: 12,
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                ))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

/// final redeem Dialog bOx
ShowRedeemfinal(int index) {
  return showDialog(
      barrierDismissible: true,
      context: navigation_service.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        TextEditingController nameCon = TextEditingController();
        TextEditingController emailCon = TextEditingController();
        return Padding(
          padding: EdgeInsets.only(right: w * 0.03, left: w * 0.03),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.06),
                  child: Container(
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(children: [
                          SizedBox(
                            height: h * 0.05,
                          ),
                          GradientText(
                            WOHOOO_INNOVATION_ON_WAY,
                            style: GoogleFonts.alegreyaSans(
                              fontSize: 23.0,
                            ),
                            gradientType: GradientType.linear,
                            colors: const [
                              Color(0xff423795),
                              Color(0xffED1A58),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          IBMPlexsansText(YOU_WILL_RECEIVE_YOUR_GIFT_CART_EMAIL,
                              skyblue, FontWeight.normal, 18)
                        ])),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: transparent,
                    radius: h * 0.06,
                    backgroundImage:
                        AssetImage(index == 1 ? nftImage : creditRedim),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "£123",
                            style: GoogleFonts.lusitana(
                                fontSize: 23, color: white),
                          ),
                          Text(CREDIT,
                              style: GoogleFonts.inriaSerif(
                                fontSize: 12,
                                color: white,
                                fontWeight: FontWeight.bold,
                              ))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
