// ignore_for_file: file_names, prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../component/text_style.dart';
import '../../../../utils/custom_tabbar_widget.dart';

class my_order_screen extends StatefulWidget {
  const my_order_screen({super.key});

  @override
  State<my_order_screen> createState() => my_order_screenState();
}

class my_order_screenState extends State<my_order_screen> {
  var myOrderlst = [NEW_ORDERS, PAST_ORDERS];
  int currentOrder = 0;

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: black),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Navigator.pop(NavigationService.navigatorKey.currentContext!);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 22,
            color: black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              thinkIcon,
              height: 40,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: w * 0.04,
          right: w * 0.04,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(bottom: h * 0.03),
              child: AlegreyaText(MyOrder, black, FontWeight.w500, 30)),

          //  call  custom Tabbar
          customTabbarWith2Tabs(
            0,
            () {
              currentOrder = 0;
              setState(() {});
            },
            h * 0.05,
            w * 0.4,
            currentOrder == 0 ? primary1 : transparent,
            currentOrder == 0 ? white : transparent,
            IBMPlexsansText(new_order, currentOrder == 0 ? white : black75,
                FontWeight.w500, 13),
            () {
              currentOrder = 1;
              setState(() {});
            },
            h * 0.05,
            w * 0.4,
            currentOrder == 1 ? primary1 : transparent,
            currentOrder == 1 ? white : transparent,
            IBMPlexsansText(past_order, currentOrder == 1 ? white : black75,
                FontWeight.w500, 13),
          ),

          SizedBox(
            height: h * 0.02,
          ),
          Expanded(
            child: ListView.builder(
                controller: controller,
                itemCount: 7,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: h * 0.015),
                    child: SizedBox(
                      width: w * 1,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.01, vertical: h * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(userImage),
                                    ),
                                    SizedBox(
                                      width: w * 0.02,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AlegreyaText("Happy Bar & Grill", black,
                                            FontWeight.w500, h * 0.022),
                                        SizedBox(
                                          height: h * 0.005,
                                        ),
                                        Row(
                                          children: [
                                            IBMPlexsansText(
                                                "£32.50 - 2-Jan-20 . ",
                                                black80,
                                                FontWeight.normal,
                                                14),
                                            SvgPicture.asset(
                                              bikeIcon,
                                              color: grey90,
                                              height: h * 0.02,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ]),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  currentOrder == 1
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: AlegreyaText(DILIVERED,
                                              primary1, FontWeight.w500, 15),
                                        )
                                      : MaterialButton(
                                          height: h * 0.025,
                                          onPressed: () {},
                                          color: orange,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: IBMPlexsansText(TRACK_PROGRESS,
                                              white, FontWeight.w500, 12),
                                        ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 14,
                                          backgroundColor: primary1,
                                          child: Icon(
                                            Icons.phone,
                                            color: white,
                                            size: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: w * 0.015,
                                        ),
                                        CircleAvatar(
                                          radius: 14,
                                          backgroundColor: primary1,
                                          child: Icon(
                                            Icons.message_rounded,
                                            color: white,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
