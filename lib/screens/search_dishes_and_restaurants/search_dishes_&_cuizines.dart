// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors, sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_text_fields.dart';
import '../../component/images_constant.dart';
import '../../component/navigator_key.dart';
import '../../component/text_constant_key.dart';
import '../../utils/app_bar_widgets.dart';
import '../../utils/custom_bottom_sheet.dart';
import '../../utils/custom_tabbar_widget.dart';
import '../../utils/dialog_box_widgets.dart';
import '../dashboard_screens/dashboard_floting_bottom_sheet/deliver_time_bottom_sheet.dart';

class search_dishes_cuizines extends StatefulWidget {
  const search_dishes_cuizines({super.key});

  @override
  State<search_dishes_cuizines> createState() => search_dishes_cuizinesState();
}

class search_dishes_cuizinesState extends State<search_dishes_cuizines> {
  List allCuisine = [
    {
      "title": "Pizza",
      "subtitle": "Italian · £££ · ",
      "image": "assets/images/image1.jpeg",
    },
    {
      "title": "Indian",
      "subtitle": "Italian · £££ · ",
      "image": "assets/images/image2.jpeg"
    },
    {
      "title": "Americain",
      "subtitle": "Italian · £££ · ",
      "image": "assets/images/image4.jpeg"
    },
    {
      "title": "Domiswsqwsqwnos",
      "subtitle": "Italian · £££ · ",
      "image": "assets/images/image3.jpeg"
    },
  ];

  List allData = [
    {
      "title": "Venues",
      "data": [
        {
          "title": "Pizza",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image1.jpeg",
        },
        {
          "title": "Indian",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image2.jpeg"
        },
        {
          "title": "Americain",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image4.jpeg"
        },
        {
          "title": "Domiswsqwsqwnos",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image3.jpeg"
        },
      ]
    },
    {
      "title": "HomeChefs",
      "data": [
        {
          "title": "Pizza",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image1.jpeg",
        },
        {
          "title": "Indian",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image2.jpeg"
        },
        {
          "title": "Americain",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image4.jpeg"
        },
      ]
    },
    {
      "title": "Dishes",
      "data": [
        {
          "title": "Pizza",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image1.jpeg",
        },
        {
          "title": "Indian",
          "subtitle": "Italian · £££ · ",
          "image": "assets/images/image2.jpeg"
        },
      ]
    },
  ];
  var serchController2 = TextEditingController();

  int? currentIndex;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar(""),
      body: Padding(
        padding:
            EdgeInsets.only(left: w * 0.045, right: w * 0.045, top: h * 0.005),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchTextField(
                  SvgPicture.asset(
                    searchIcon,
                  ),
                  searchforReataurants,
                  TextStyle(color: black, fontSize: 17),
                  TextStyle(color: grey90, fontSize: 15),
                  () {},
                  SvgPicture.asset(
                    filterIcon,
                  ),
                  serchController2),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w * 0.03, right: w * 0.03),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5),
                    height: h * 0.04,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: IBMPlexsansText(
                        All_CUISINE, white, FontWeight.normal, 14),
                  ),
                  SizedBox(
                    height: h * 0.04,
                    width: w * 0.65,
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Wrap(
                          children: List.generate(
                              allCuisine.length,
                              (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: FittedBox(
                                    child: Container(
                                      height: h * 0.04,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      margin: EdgeInsets.only(
                                          right: w * 0.02, bottom: 10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: red),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: currentIndex == index
                                              ? primary1
                                              : white.withOpacity(0.8)),
                                      child: IBMPlexsansText(
                                          allCuisine[index]['title'].toString(),
                                          currentIndex == index
                                              ? white
                                              : grey90,
                                          FontWeight.bold,
                                          14),
                                    ),
                                  )),
                              growable: true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      FilterTapButton(() {
                        index = 0;
                        setState(() {});
                      },
                          eatIcon,
                          index == 0 ? primary1 : white,
                          index == 0 ? primary1 : red,
                          index == 0 ? white : orange),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(eatout, grey90, FontWeight.bold, 12)
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.03, right: w * 0.03),
                          child: FilterTapButton(() {
                            index = 1;
                            setState(() {});
                          },
                              bikeIcon,
                              index == 1 ? primary1 : white,
                              index == 1 ? primary1 : red,
                              index == 1 ? white : orange)),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(delivery, grey90, FontWeight.bold, 12)
                    ],
                  ),
                  Column(
                    children: [
                      FilterTapButton(() {
                        index = 2;
                        setState(() {});
                      },
                          bagIcon,
                          index == 2 ? primary1 : white,
                          index == 2 ? primary1 : red,
                          index == 2 ? white : orange),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(collection, grey90, FontWeight.bold, 12)
                    ],
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Column(
                    children: [
                      FilterTapButton(() {
                        index = 3;
                        setState(() {});
                      },
                          chiefAtHomeIcon,
                          index == 3 ? primary1 : white,
                          index == 3 ? primary1 : red,
                          index == 3 ? white : orange),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(chief_atHome, grey90, FontWeight.bold, 12)
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: h * 0.026, left: w * 0.005),
                    child: GestureDetector(
                      onTap: () {
                        show_dialog_with_annimation(h * 0.35, [
                          IBMPlexsansText(
                              "When you upload a FoodSnap, instead of your first name, we can show your instagram ID as the contributor.  Once your photo has been approved and live on the restaurant’s menu, it will be visible by all SnapEaters. Thus generating traffic to your instagram, especially useful for food/lifestyle bloggers. However, if you wish to remain private, leave this blank. And don’t worry, we will still credit your photo with your first name, profile picture and SnapEat status badge.",
                              black,
                              FontWeight.normal,
                              15),
                        ]);
                      },
                      child: SvgPicture.asset(
                        thinkIcon,
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              GestureDetector(
                  onTap: () {
                    showCustomBottomSeet(deliver_time_bottom_sheet());
                  },
                  child: Container(
                      // duration: Duration(milliseconds: 250),
                      height: h * 0.04,
                      width: index == 0 ? w * 0.42 : w * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: red)),
                      child: Row(children: [
                        index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Image.asset(manyPerson),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    IBMPlexsansText(
                                        "2", black80, FontWeight.bold, 17),
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          width: w * 0.02,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_sharp,
                              color: grey90,
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            IBMPlexsansText(ASAP, black80, FontWeight.bold, 17),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: grey90,
                              size: 28,
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                          ],
                        ),
                      ]))),
              SizedBox(
                height: h * 0.015,
              ),
              Divider(
                color: grey90,
              ),
              ListView.builder(
                  itemCount: allData.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: h * 0.02),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IBMPlexsansText(
                                  allData[index]['title'].toString(),
                                  black,
                                  FontWeight.bold,
                                  20),
                              TextUnderline("See all(20)", primary1,
                                  FontWeight.normal, 15, transparent, primary1)
                            ],
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          ListView.builder(
                              itemCount: allData[index]["data"].length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int k) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              allData[index]["data"][k]['image']
                                                  .toString()),
                                        ),
                                        SizedBox(
                                          width: w * 0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IBMPlexsansText(
                                                allData[index]['data'][k]
                                                        ['title']
                                                    .toString(),
                                                black,
                                                FontWeight.bold,
                                                17),
                                            Row(
                                              children: [
                                                IBMPlexsansText(
                                                    allData[index]['data'][k]
                                                            ['subtitle']
                                                        .toString(),
                                                    black80,
                                                    FontWeight.normal,
                                                    14),
                                                SvgPicture.asset(starIcon),
                                                IBMPlexsansText(
                                                    "4.9 . ,0.8m",
                                                    black80,
                                                    FontWeight.normal,
                                                    14),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider()
                                  ],
                                );
                              }),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
