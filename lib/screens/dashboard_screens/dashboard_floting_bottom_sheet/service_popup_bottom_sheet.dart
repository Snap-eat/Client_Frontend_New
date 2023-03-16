// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables, override_on_non_overriding_member, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/text_style.dart';

class service_popup_bottom_sheet extends StatefulWidget {
  const service_popup_bottom_sheet({super.key});
  @override
  State<service_popup_bottom_sheet> createState() =>
      service_popup_bottom_sheetState();
}

class service_popup_bottom_sheetState
    extends State<service_popup_bottom_sheet> {
  var h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return SizedBox(
          width: width,
          height: constraints.maxHeight,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                bottom: -height * 0.83,
                right: 10,
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: primary1,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: h * 0.135),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    cameraIcon,
                                    height: 30,
                                  ),
                                  IBMPlexsansText(
                                      upload_food, white, FontWeight.w500, 12),
                                ],
                              ),
                              SizedBox(
                                width: w * 0.15,
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(icon3d),
                                  IBMPlexsansText(
                                      explore3d, white, FontWeight.w500, 12)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    QrScanIcon,
                                    color: white,
                                    height: 50,
                                  ),
                                  IBMPlexsansText(
                                      qrScan, white, FontWeight.w500, 12)
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Transform.rotate(
                                        angle: 15.2,
                                        child: Container(
                                          height: h * 0.07,
                                          width: 1,
                                          color: white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.15,
                                      ),
                                      Transform.rotate(
                                        angle: -52.95,
                                        child: Container(
                                          height: h * 0.07,
                                          width: 1,
                                          color: white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30),
                                        child: Transform.rotate(
                                          angle: -49.7,
                                          origin: Offset(1, 1),
                                          child: Container(
                                            height: 1,
                                            width: w * 0.13,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: h * 0.01,
                                            left: w * 0.02,
                                            right: w * 0.02),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundColor: white,
                                            child: Icon(
                                              Icons.clear,
                                              size: 17,
                                              color: grey90,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30),
                                        child: Transform.rotate(
                                          angle: 40.23,
                                          child: Container(
                                            height: 1,
                                            width: w * 0.13,
                                            color: white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    SettinIcon,
                                    height: 35,
                                  ),
                                  IBMPlexsansText(choose_service, white,
                                      FontWeight.w500, 12)
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
