// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';

import '../../../component/images_constant.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../utils/custom_row_widget.dart';

class how_to_earn_rewards_dialog_content extends StatelessWidget {
  const how_to_earn_rewards_dialog_content({super.key});

  @override
  Widget build(BuildContext context) {
    var rewardsList = [
      {"title": REWARD_CREDITS, "subTitle": EARN_NFT_CREDITS, "image": doller2},
      {
        "title": NFT_CREDIT,
        "subTitle": EARN_CREDIT_WITH_EACH_ORDER,
        "image": nfty
      },
      {
        "title": EXCLUSIVE_OFFERS_SNAPEAT,
        "subTitle": GET_EXLCUSIVE_DISCOUNTS,
        "image": re1
      },
      {
        "title": EXCLUSIVE_INVITE_SNAPEAT,
        "subTitle": GET_RESTAURANT_INVITES,
        "image": re2
      },
    ];
    return Column(children: [
      SizedBox(
        height: h * 0.02,
      ),
      IBMPlexsansText(HOW_TO_EARN_POINTS_REWARDS, black, FontWeight.bold, 22),
      IBMPlexsansText(help_community, black, FontWeight.bold, 13),
      SizedBox(
        height: h * 0.02,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: IBMPlexsansText(REWARDS, black, FontWeight.bold, 18)),
      SizedBox(
        height: h * 0.01,
      ),
      ListView.builder(
          itemCount: rewardsList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: h * 0.01, bottom: h * 0.005),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: white,
                    radius: h * 0.035,
                    backgroundImage: AssetImage(
                      rewardsList[index]['image'].toString(),
                    ),
                  ),
                  SizedBox(width: w * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IBMPlexsansText(rewardsList[index]['title'].toString(),
                          black50, FontWeight.bold, 12),
                      IBMPlexsansText(rewardsList[index]['subTitle'].toString(),
                          black50, FontWeight.normal, 9)
                    ],
                  )
                ],
              ),
            );
          }),
      SizedBox(
        height: h * 0.03,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: IBMPlexsansText(POINTS, black, FontWeight.bold, 18)),
      Padding(
          padding: EdgeInsets.only(top: h * 0.03, bottom: h * 0.015),
          child: customRow(starIcon2, RESTAURANT_REVIEW_50POINTS)),
      Divider(),
      Padding(
          padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.015),
          child: customRow(starIcon2, MEAL_REVIEW_100POINTS)),
      Divider(),
      Padding(
          padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.015),
          child: customRow(camrealogo, FOODSNAP_APPROVED_UPLOAD)),
      Divider(),
      Padding(
          padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.015),
          child: customRow(manyPerson, FRIEND_1_SIGNUP_ORDER)),
      Divider(),
      Padding(
          padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.015),
          child: customRow(
            FRIEND_5_SIGNUP_ORDER,
            manyPerson,
          )),
      Divider(),
      SizedBox(
        height: h * 0.01,
      ),
      Padding(
          padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.015),
          child: customRow(
            FRIEND_10_SIGNUP_ORDER,
            manyPerson,
          )),
      SizedBox(
        height: h * 0.02,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: IBMPlexsansText(AWARDS, black, FontWeight.bold, 18)),
      SizedBox(
        height: h * 0.02,
      ),
      Row(
        children: [
          Image.asset(
            goldenM,
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: h * 0.015, bottom: h * 0.015, left: w * 0.02),
              child: IBMPlexsansText(
                  TOP_50_SNAPEATRS_THE_MONTH, black50, FontWeight.bold, 12)),
        ],
      ),
      Divider(),
      Row(
        children: [
          Image.asset(
            goldenM,
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: h * 0.015, bottom: h * 0.015, left: w * 0.02),
              child: IBMPlexsansText(
                  TOP_50_SNAPEATRS_THE_MONTH, black50, FontWeight.bold, 12)),
        ],
      ),
    ]);
  }
}
