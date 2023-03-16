// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../utils/app_bar_widgets.dart';
import 'exclusive_offer.dart';
import 'rewards_credit.dart';

class my_rewards_main_page extends StatefulWidget {
  const my_rewards_main_page({super.key});

  @override
  State<my_rewards_main_page> createState() => my_rewards_main_pageState();
}

class my_rewards_main_pageState extends State<my_rewards_main_page> {
  var list = [REWARD_CREDITS, NFT_COINS, EXCLUSIVE_OFFERS, EXCLUSIVE_INVITES];
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: customAppBar(''),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: w * 0.05, right: w * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlegreyaText(MY_REWARDS, black, FontWeight.normal, 30),
                GestureDetector(
                  onTap: () {
                    unlockReawars(); // call to unlock rewards method
                  },
                  child: SvgPicture.asset(
                    thinkIcon,
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: h * 0.05,
            margin: EdgeInsets.only(
                left: w * 0.045, right: w * 0.04, top: h * 0.025),
            decoration: BoxDecoration(
                color: black40, borderRadius: BorderRadius.circular(35),
                // ignore: prefer_const_literals_to_create_immutables
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
                                  left: w * 0.03, right: w * 0.03),
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
                                // ignore: prefer_const_literals_to_create_immutables
                              ),
                              child: IBMPlexsansText(
                                  list[index],
                                  selectedTab == index ? white : black80,
                                  FontWeight.bold,
                                  14),
                            ),
                          ),
                          index == 3
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(
                                      left: w * 0.02, right: w * 0.02),
                                  height: 30,
                                  width: 1,
                                  color: white,
                                )
                        ],
                      );
                    })),
          ),
          selectedTab == 0
              ? Expanded(
                  // call to  RewardsCredit screen
                  child: rewards_credit(
                  index: selectedTab = 0,
                ))
              : selectedTab == 1
                  ? Expanded(
                      // call to  rewards_credit screen
                      child: rewards_credit(
                      index: selectedTab = 1,
                    ))
                  : selectedTab == 2
                      ? Expanded(
                          // call to  ExclusiveOffer screen
                          child: exclusive_offer(
                          index: selectedTab,
                        ))
                      : selectedTab == 3
                          ? Expanded(
                              // call to  exclusive_offer screen
                              child: exclusive_offer(
                              index: selectedTab,
                            ))
                          : Container()
        ]));
  }
}

// create function for unlock rewards
unlockReawars() {
  return showDialog(
      barrierDismissible: true,
      barrierColor: Colors.white.withOpacity(0.8),
      context: navigation_service.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(right: w * 0.27, left: w * 0.27),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(20)),

              // height: h * 0.5,
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    IBMPlexsansText(
                        UNLOCK_THIS_REWARDS, orange, FontWeight.bold, 14),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundColor: transparent,
                        radius: h * 0.035,
                        backgroundImage: AssetImage(CircleImage),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(diamond),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          goldenM,
                          height: 20,
                        ),
                        IBMPlexsansText(
                            "3000/15,000Pts ", black50, FontWeight.bold, 15),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    IBMPlexsansText("SnapConnoisseur \n Level", primary1,
                        FontWeight.bold, 14)
                  ])),
            ),
          ),
        );
      });
}
