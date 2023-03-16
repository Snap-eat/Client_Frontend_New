// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../utils/custom_list_tile_widgets.dart';

class restaurants_review extends StatefulWidget {
  const restaurants_review({super.key});

  @override
  State<restaurants_review> createState() => restaurants_reviewState();
}

class restaurants_reviewState extends State<restaurants_review> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: h * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AlegreyaText(
                      "Happy Bar & Grill", primary1, FontWeight.normal, 19),
                  IBMPlexsansText(
                      "🏆 50 points ", grey90, FontWeight.normal, 17)
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: h * 0.035,
                      backgroundImage: const AssetImage(userImage)),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.03, top: h * 0.015),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AlegreyaText(AMAZING, black, FontWeight.normal, 16),
                        SizedBox(
                          height: h * 0.006,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AvdPicture.asset(starIcon),
                                AvdPicture.asset(starIcon),
                                AvdPicture.asset(starIcon),
                                AvdPicture.asset(starIcon),
                                AvdPicture.asset(starIcon),
                              ],
                            ),
                            IBMPlexsansText("18th March, 2020 ", grey90,
                                FontWeight.normal, 13)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(IT_WAS_AMAZING_ATMOSPHERE,
                  style: GoogleFonts.ibmPlexSans(
                      fontSize: 13,
                      color: grey90,
                      fontStyle: FontStyle.italic)),
              SizedBox(
                height: h * 0.015,
              ),
              customDivider()
            ],
          );
        });
  }
}
