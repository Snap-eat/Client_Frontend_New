// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, avoid_print, file_names, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/custom_buttons.dart';
import '../../../utils/custom_list_tile_widgets.dart';
import 'schedule_for_later_bottom_sheet.dart';

class deliver_time_bottom_sheet extends StatefulWidget {
  const deliver_time_bottom_sheet({super.key});
  @override
  State<deliver_time_bottom_sheet> createState() =>
      deliver_time_bottom_sheetState();
}

class deliver_time_bottom_sheetState extends State<deliver_time_bottom_sheet> {
  String groupValue = ASAP;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: groupValue == seduleforLater ? h * 0.65 : h * 0.32,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: h * 0.03, right: w * 0.03, top: h * 0.01, bottom: h * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AlegreyaText(Deliverytime, black, FontWeight.w500, 21),
              // call to custom radio button
              customRadioBtn(asapIcon, ASAP, groupValue, (value) {
                setState(() {
                  groupValue = value;
                });
              }, ASAP),
              customDivider(),
              // call to custom radio button
              customRadioBtn(sedulecallendor, seduleforLater, groupValue,
                  (value) {
                setState(() {
                  groupValue = value;
                });
              }, seduleforLater),
              groupValue == seduleforLater
                  ? Expanded(
                      child:
                          schedule_for_later_bottom_sheet()) // call to schedule for later class
                  : Container(),

              // call to  defalut login button
              Padding(
                padding: const EdgeInsets.all(13),
                child: DefaultButtonLogin(
                    width: w * 1,
                    height: h * 0.06,
                    text: Confirm,
                    press: () {
                      Navigator.pop(context);
                    },
                    colors: [primary_light, primary]),
              )
            ],
          ),
        ));
  }
}
