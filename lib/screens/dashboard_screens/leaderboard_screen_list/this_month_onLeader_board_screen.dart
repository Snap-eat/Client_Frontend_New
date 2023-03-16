// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/container_widgets.dart';

int currentIndex = 0;
List victorlst = [
  {"name": "Victor", "image": userImage, "points": 800},
  {"name": "Harry", "image": userImage, "points": 700},
  {"name": "Alexender", "image": userImage, "points": 600},
  {"name": "Drumil", "image": userImage, "points": 500},
  {"name": "Bhimsingh", "image": userImage, "points": 300},
  {"name": "Surendra", "image": userImage, "points": 200},
  {"name": "Rohan", "image": userImage, "points": 100},
];

class this_month_onleader_board_screen extends StatefulWidget {
  int index;
  this_month_onleader_board_screen({
    super.key,
    required this.index,
  });
  @override
  State<this_month_onleader_board_screen> createState() =>
      this_month_onleader_board_screenState();
}

class this_month_onleader_board_screenState
    extends State<this_month_onleader_board_screen> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          controller: controller,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                left: w * 0.045, right: w * 0.045, bottom: h * 0.02),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlegreyaText(Thisleaderboard_is, black80.withOpacity(0.7),
                      FontWeight.w500, 16),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    padding: EdgeInsets.only(left: 8, right: 8),
                    alignment: Alignment.center,
                    height: h * 0.03,
                    decoration: BoxDecoration(
                      color: widget.index == 0
                          ? primary1
                          : widget.index == 1
                              ? orange
                              : widget.index == 2
                                  ? primary1
                                  : orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IBMPlexsansText(
                        widget.index == 0
                            ? LIVE
                            : widget.index == 1
                                ? CLOSED
                                : widget.index == 2
                                    ? LIVE
                                    : "",
                        white,
                        FontWeight.bold,
                        11),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  customVictoryContainer("£10", "Daniel", "4200 pts", userImage,
                      sliverM, silverModel),
                  customVictoryContainer("£25", "Alexender", "4200 pts",
                      userImage, goldenM, goldenModal),
                  customVictoryContainer("£15", "Harry", "4200 pts", userImage,
                      branzM, branzMoedal),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              ListView.builder(
                  controller: controller,
                  itemCount: victorlst.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                              radius: 35,
                                              backgroundImage:
                                                  AssetImage(userImage)),
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: CircleAvatar(
                                              backgroundColor: orange,
                                              radius: 17,
                                              child: IBMPlexsansText(
                                                  "#${index + 3}",
                                                  white,
                                                  FontWeight.bold,
                                                  16),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                  IBMPlexsansText(
                                      victorlst[index]['name'].toString(),
                                      black,
                                      FontWeight.w500,
                                      20),
                                ],
                              ),
                              Container(
                                height: h * 0.04,
                                padding: EdgeInsets.only(
                                  left: w * 0.02,
                                  right: w * 0.02,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(color: orange)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      goldenM,
                                      height: h * 0.02,
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    IBMPlexsansText(
                                        "${victorlst[index]['points']} pts",
                                        orange,
                                        FontWeight.w500,
                                        12)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider()
                        ],
                      ),
                    );
                  })
            ]),
          ),
        ),

        // call the victor detai  function
        Align(
          alignment: Alignment.bottomCenter,
          child: victorPage(
              currentIndex + 3,
              victorlst[currentIndex]['image'].toString(),
              victorlst[currentIndex]['name'].toString(),
              victorlst[currentIndex]['points'].toString()),
        )
      ],
    );
  }

// create victor list on tap  victoe detail

  victorPage(
    int index,
    String image,
    String name,
    var points,
  ) {
    return Container(
      padding: EdgeInsets.only(left: w * 0.03, right: w * 0.03, top: h * 0.01),
      decoration: BoxDecoration(
          color: white, boxShadow: [BoxShadow(color: grey, blurRadius: 5)]),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(60)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(image.toString())),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor: primary1,
                              radius: 17,
                              child: AlegreyaText(
                                  "#${index}", white, FontWeight.w500, 16),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  IBMPlexsansText(name.toString(), black, FontWeight.w500, 20),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    left: w * 0.045,
                    right: w * 0.045,
                    top: h * 0.01,
                    bottom: h * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: primary1)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          goldenM,
                          height: h * 0.02,
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        IBMPlexsansText(
                            points.toString(), primary1, FontWeight.w500, 12)
                      ],
                    ),
                    IBMPlexsansText(
                        "3,780pts to #1", orange, FontWeight.bold, 10)
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          AlegreyaText(
              THANKS_FOR_HELPING_SNAPEATRS, grey90, FontWeight.w700, 13),
          AlegreyaText(
              GET_50REWARDS_TOP_SNAPEATRS, black80, FontWeight.w500, 13),
          AlegreyaText(
              GET_100REWARDS_TOP_SNAPEATRS, black80, FontWeight.w500, 13),
          SizedBox(
            height: h * 0.03,
          )
        ],
      ),
    );
  }
}
