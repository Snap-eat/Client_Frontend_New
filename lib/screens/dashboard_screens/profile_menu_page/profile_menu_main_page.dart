// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigation_routes.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../utils/custom_list_tile_widgets.dart';
import '../../../utils/dialog_box_widgets.dart';
import '../profile_menu_screen_list/contributions_sub_screens/contributions.dart';
import '../profile_menu_screen_list/gift_&_corporate_cards_sub_screens/corporate_cards_main_page.dart';
import '../profile_menu_screen_list/how_to_earn_rewards_dialog_content.dart';
import '../profile_menu_screen_list/message_screen.dart';
import '../profile_menu_screen_list/my__favorites_screen_list/my_favorites_main_page.dart';
import '../profile_menu_screen_list/my_rewards_screen_list/my_rewards_main_page.dart';
import '../profile_menu_screen_list/profile_sub_screens_list/profile_main_page.dart';
import '../profile_menu_screen_list/promotion_screen.dart';

class profile_menu_main_page extends StatefulWidget {
  const profile_menu_main_page({super.key});

  @override
  State<profile_menu_main_page> createState() => profile_menu_main_pageState();
}

class profile_menu_main_pageState extends State<profile_menu_main_page> {
  var languageList = ["English", "Hindi", "China", "Marathi"];
  var firstlan = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: w * 0.03, right: w * 0.03, top: h * 0.05, bottom: h * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: h * 0.06,
                              backgroundImage: const AssetImage(userImage)),
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.03, top: h * 0.015),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AlegreyaText(
                                    "Elizabeth", black, FontWeight.normal, 30),
                                AlegreyaText("SnapGourmet", primary1,
                                    FontWeight.normal, 26)
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          notification,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.025, top: h * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AlegreyaText(
                        "Hi Elizabeth", primary1, FontWeight.normal, 25),
                    SizedBox(
                      height: h * 0.005,
                    ),
                    Row(
                      children: [
                        Image.asset(doller),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        IBMPlexsansText(YOU_HAVE_REWARDS_CREDIT_NFT, black,
                            FontWeight.bold, 12)
                      ],
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    AnimatedContainer(
                        height: h * 0.02,
                        width: w * 1,
                        duration: Duration(milliseconds: 1200),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: grey,
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(color: grey90, blurRadius: 5)
                            ]),
                        child: Row(
                          children: [
                            Container(
                              width: w * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: orange,
                              ),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            IBMPlexsansText(
                                "4,500 points", orange, FontWeight.bold, 12),
                          ],
                        )),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    SizedBox(
                      height: h * 0.2,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  right: w * 0.02,
                                  top: h * 0.01,
                                  bottom: h * 0.01),
                              padding: EdgeInsets.all(h * 0.01),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(12),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(color: grey, blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: h * 0.035,
                                    backgroundColor: orange,
                                    child: CircleAvatar(
                                      backgroundColor: white,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: h * 0.01),
                                        child: Image.asset(sitaraIcon),
                                      ),
                                      radius: h * 0.0333,
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        goldenM,
                                        height: h * 0.02,
                                      ),
                                      SizedBox(
                                        width: w * 0.01,
                                      ),
                                      IBMPlexsansText("3,000/3000 points",
                                          black50, FontWeight.bold, 12),
                                    ],
                                  ),
                                  MaterialButton(
                                    height: h * 0.035,
                                    onPressed: () {},
                                    color: primary1,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: IBMPlexsansText(SNAP_FOODIE, white,
                                        FontWeight.bold, 12),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: h * 0.025,
                    ),
                    AlegreyaText(EARN_MORE_1500_POINTS_TO_UNLOCK_REWARDS,
                        black50, FontWeight.normal, 15),
                    GestureDetector(
                      onTap: () {
                        show_dialog_with_multipal_parameters(() {
                          Navigator.pop(context);
                        }, [how_to_earn_rewards_dialog_content()], white);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(thinkIcon),
                          SizedBox(
                            width: w * 0.01,
                          ),
                          TextUnderline(HOW_TO_EARN_POINTS_REWARDS, primary1,
                              FontWeight.normal, 15, transparent, primary1),
                          Divider(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    customListtile(() {
                      pushTo(profile_main_page()); // call to  Profile screen
                    }, profile),
                    Divider(),
                    customListtile(() {
                      pushTo(message_screen()); // call to  Message screen
                    }, message),
                    Divider(),
                    customListtile(() {
                      pushTo(promotion_screen()); // call to  Promotion screen
                    }, promotions),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.01, bottom: h * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pushTo(
                                  my_rewards_main_page()); // call to  My Rewards screen
                            },
                            child: Row(
                              children: [
                                IBMPlexsansText(
                                    myReawards, black, FontWeight.w500, 15),
                                SizedBox(
                                  width: w * 0.03,
                                ),
                                Image.asset(rewardImage)
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: w * 0.03),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 20,
                              color: primary1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    customListtile(() {
                      pushTo(
                          my_favorites_main_page()); // call to  MyFavorites screen
                    }, Favorites),
                    Divider(),
                    customListtile(() {
                      pushTo(
                          corporate_cards_main_page()); // call to  Corporates cards  screen
                    }, CorporateCards),
                    Divider(),
                    customListtile(() {
                      pushTo(contributions()); // call to  Contribution  screen
                    }, Contributions),
                    Divider(),
                    customListtile(() {}, Contact),
                    Divider(),
                    customListtile(() {}, About),
                    Divider(),
                    customListtile(() {}, every_order_helps_wants_to_see),
                    Divider(),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: IBMPlexsansText(invite_a_friend_get_rewards,
                          black80, FontWeight.w600, 14),
                    ),
                    Divider(),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: IBMPlexsansText(rate_app_get_reward_credit,
                          black80, FontWeight.w600, 14),
                    ),
                    Divider(),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: TextUnderline(become_homechief, primary1,
                          FontWeight.w600, 14, transparent, primary1),
                    ),
                    Divider(),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: TextUnderline(become_homechief, primary1,
                          FontWeight.w600, 14, transparent, primary1),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.01, bottom: h * 0.03),
                      child: Row(
                        children: [
                          IBMPlexsansText(
                              Language, black80, FontWeight.bold, 15),
                          SizedBox(
                            width: w * 0.45,
                            child: Theme(
                              data: ThemeData(dividerColor: Colors.transparent),
                              child: DropdownButtonFormField<String>(
                                isDense: true,
                                icon: Padding(
                                  padding: EdgeInsets.only(right: w * 0.08),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: grey90,
                                  ),
                                ),
                                style: TextStyle(color: grey90),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: CircleAvatar(
                                        backgroundColor: white,
                                        child: Image.asset(flag))),
                                hint: Text(
                                  'English',
                                ),
                                value: firstlan,
                                items: languageList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(cIcon),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: IBMPlexsans2(all_right_reserved_sanpeat_ltd,
                                black, FontWeight.w600, 15))
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(rIcon),
                        SizedBox(
                            width: w * 0.75,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: IBMPlexsans2(
                                    snapeat_registered_trademark,
                                    black50,
                                    FontWeight.w500,
                                    14)))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
