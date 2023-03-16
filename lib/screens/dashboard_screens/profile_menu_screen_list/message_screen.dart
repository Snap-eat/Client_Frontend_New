// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/component/text_style.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigator_key.dart';
import '../../../utils/app_bar_widgets.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_text_fields.dart';

class message_screen extends StatefulWidget {
  const message_screen({super.key});

  @override
  State<message_screen> createState() => message_screenState();
}

class message_screenState extends State<message_screen> {
  var serchController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar(''),
      body: Padding(
        padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlegreyaText(MESSAGES, black, FontWeight.normal, 30),
              Image.asset(checkIcon)
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          searchTextField(
              SvgPicture.asset(searchIcon),
              SEARCH_MESSAGES,
              TextStyle(),
              GoogleFonts.alegreyaSans(color: grey90, fontSize: 16),
              () {},
              Text(""),
              serchController3),
          SizedBox(
            height: h * 0.02,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 15,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: h * 0.01, bottom: h * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    radius: h * 0.04,
                                    backgroundImage: AssetImage(userImage)),
                                SizedBox(
                                  width: w * 0.04,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AlegreyaText(INAMO_SOHO, black80,
                                        FontWeight.normal, 18),
                                    AlegreyaText(ORDER_DONT_HAVE_ARRIEVED,
                                        black80, FontWeight.normal, 14),
                                  ],
                                )
                              ],
                            ),
                            IBMPlexsansText(
                                "24 June", black30, FontWeight.bold, 14),
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  );
                }),
          )
        ]),
      ),
    );
  }
}
