// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../utils/custom_loader.dart';
import 'my_favorites_main_page.dart';

class restaurants_screen extends StatefulWidget {
  const restaurants_screen({super.key});

  @override
  State<restaurants_screen> createState() => restaurants_screenState();
}

class restaurants_screenState extends State<restaurants_screen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.28,
                    width: w * 1,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: const [
                          BoxShadow(color: grey, blurRadius: 15)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[index]['image'].toString()),
                          onError: (exception, stackTrace) =>
                              Center(child: customLoader),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 15),
                          child: GestureDetector(
                              onTap: () {},
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(favoriteIcon))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AlegreyaText(
                      "Blackstar Restaurant", black, FontWeight.w500, 21),
                  SizedBox(
                    height: h * 0.005,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        pin,
                        height: 15,
                      ),
                      AlegreyaText("Westminter  0.8m away", black80,
                          FontWeight.bold, 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Icon(
                          Icons.access_time_rounded,
                          color: grey90,
                          size: 15,
                        ),
                      ),
                      AlegreyaText(
                          "Closes at 10pm", black80, FontWeight.bold, 12),
                    ],
                  ),
                  Row(
                    children: [
                      IBMPlexsansText(
                          "Australian · £££", black80, FontWeight.bold, 12),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: SvgPicture.asset(
                          starIcon,
                          height: 15,
                        ),
                      ),
                      IBMPlexsansText("4.9 ", black, FontWeight.bold, 12),
                      IBMPlexsansText(
                          " (361 reviews)", grey90, FontWeight.bold, 12),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
