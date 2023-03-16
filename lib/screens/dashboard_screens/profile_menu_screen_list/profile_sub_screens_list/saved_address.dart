// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_interpolation_to_compose_strings, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigation_routes.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_style.dart';
import '../../../../utils/app_bar_widgets.dart';
import '../../../../utils/custom_buttons.dart';
import '../../../location_time/add_new_address.dart';

class saved_address extends StatefulWidget {
  const saved_address({super.key});

  @override
  State<saved_address> createState() => saved_addressState();
}

class saved_addressState extends State<saved_address> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar(""),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: w * 0.045, right: w * 0.03, bottom: h * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AlegreyaText(SAVED_ADDRESS, black, FontWeight.w500, 30),
              SizedBox(
                height: h * 0.02,
              ),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: Padding(
                    padding: EdgeInsets.only(right: w * 0.03),
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 20,
                      color: primary1,
                    ),
                  ),
                  leading: customButtonViewMap(
                      () {}, white, primary, HomeIcon2, AT_HOME, black)),
              Divider(),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: Padding(
                    padding: EdgeInsets.only(right: w * 0.03),
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 20,
                      color: primary1,
                    ),
                  ),
                  leading: customButtonViewMap(
                      () {}, white, primary, bagIcon, AT_WORK, black)),
              Divider(),
              ListView.builder(
                  itemCount: saveAddress.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            saveAddress.removeAt(index);
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: w * 0.02,
                                top: h * 0.015,
                                bottom: h * 0.015),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time_filled_sharp,
                                  color: primary1,
                                ),
                                SizedBox(
                                  width: w * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IBMPlexsansText(
                                        saveAddress[index].address1.toString(),
                                        black,
                                        FontWeight.w500,
                                        13),
                                    IBMPlexsansText(
                                        saveAddress[index].address2.toString(),
                                        black30,
                                        FontWeight.w500,
                                        12),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      pushTo(add_new_address());
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: primary1,
                      child: Icon(
                        Icons.add,
                        color: white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  IBMPlexsansText(ADD_NEW_ADDRESS, black30, FontWeight.w500, 15)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
