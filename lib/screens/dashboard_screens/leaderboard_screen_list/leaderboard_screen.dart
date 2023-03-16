// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_tabbar_widget.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../utils/app_bar_widgets.dart';
import '../../../utils/container_widgets.dart';
import 'this_month_onleader_board_screen.dart';

class leaderboard_screen extends StatefulWidget {
  const leaderboard_screen({super.key});
  @override
  State<leaderboard_screen> createState() => leaderboard_screenState();
}

class leaderboard_screenState extends State<leaderboard_screen> {
  int currentTab = 0;
  List leaderBoardLst = [THIS_MONTH, LAST_MONTH, MONTH_12];

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar("", [
        Padding(
          padding: EdgeInsets.only(top: 10, right: w * 0.04),
          child: SvgPicture.asset(
            thinkIcon,
            height: 25,
          ),
        )
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: w * 0.045, right: w * 0.045, bottom: h * 0.02),
              child: AlegreyaText(Leaderboard, black, FontWeight.w500, 30)),

// call to customTabbarWithMultiTabs
          customTabbarWithMultiTabs(
              0,
              h * 0.05,
              List.generate(
                  leaderBoardLst.length,
                  (index) => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              currentTab = index;
                              setState(() {});
                            },
                            child: Container(
                              width: w * 0.288,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: currentTab == index
                                    ? primary1
                                    : transparent,
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(
                                  width: 1.5,
                                  color:
                                      currentTab == index ? white : transparent,
                                ),
                              ),
                              child: IBMPlexsansText(
                                  leaderBoardLst[index],
                                  currentTab == index ? white : black75,
                                  FontWeight.w500,
                                  15),
                            ),
                          ),
                          index == leaderBoardLst.length - 1
                              ? Container()
                              : verticalLine()
                        ],
                      ))),

// call the class while tap on  selected tabs
          currentTab == 0
              ? Expanded(
                  // call to This month class
                  child: this_month_onleader_board_screen(
                    index: currentTab,
                  ),
                )
              : currentTab == 1
                  ? Expanded(
                      // call to This month class
                      child: this_month_onleader_board_screen(
                        index: currentTab,
                      ),
                    )
                  : currentTab == 2
                      ? Expanded(
                          // call to This month class
                          child: this_month_onleader_board_screen(
                            index: currentTab,
                          ),
                        )
                      : Container()
        ],
      ),
    );
  }
}
