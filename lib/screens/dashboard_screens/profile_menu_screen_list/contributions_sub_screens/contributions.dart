// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/screens/dashboard_screens/profile_menu_screen_list/contributions_sub_screens/restaurants_review.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../utils/app_bar_widgets.dart';
import '../../../../utils/dialog_box_widgets.dart';
import '../my__favorites_screen_list/dishes_screen.dart';
import '../my_rewards_screen_list/rewards_credit.dart';
import 'dialogboxes_text_constant.dart';

class contributions extends StatefulWidget {
  const contributions({super.key});

  @override
  State<contributions> createState() => contributionsState();
}

class contributionsState extends State<contributions> {
  var list = [
    YOUR_FOOD_SNAPS,
    MEAL_REVIEWS,
    RESTAURANTS_REVIEWS,
  ];
  int selectedTab = 0;

  get menuitem => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: customAppBar(''),
        body: Padding(
          padding: EdgeInsets.only(left: w * 0.045, right: w * 0.045),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlegreyaText(MY_CONTRIBUTIONS, black, FontWeight.w500, 30),
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(thinkIcon),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    showDialogBox([
                                      SvgPicture.asset(thinkIcon),
                                      foodSnapNotApproved()
                                    ]);
                                  },
                                  child: AlegreyaText(FOOD_SNAP_NOT_APPROVED,
                                      grey90, FontWeight.normal, 16)),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: h * 0.01, bottom: h * 0.01),
                                child: Divider(),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    showDialogBox([
                                      SvgPicture.asset(thinkIcon),
                                      foodSnapMenuContent()
                                    ]);
                                  },
                                  child: AlegreyaText(I_CANT_SEE_MY_FOOD,
                                      grey90, FontWeight.normal, 16)),
                              SizedBox(
                                height: h * 0.01,
                              )
                            ]))
                  ],
                  offset: Offset(0, 100),
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: h * 0.05,
              margin: EdgeInsets.only(top: h * 0.025),
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
                                    12),
                              ),
                            ),
                            index == 2
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.only(
                                        left: w * 0.01, right: w * 0.01),
                                    height: 30,
                                    width: 1,
                                    color: white,
                                  )
                          ],
                        );
                      })),
            ),
            selectedTab == 0
                ? Expanded(child: dishes_screen()) // call to  DishesScreen
                : selectedTab == 1
                    ? Expanded(
                        // call to  RewardsCredit screen
                        child: rewards_credit(
                        index: selectedTab = 1,
                      ))
                    : selectedTab == 2
                        ? Expanded(
                            // call to  RestaurantsReview screen
                            child: restaurants_review())
                        : Container()
          ]),
        ));
  }
}
