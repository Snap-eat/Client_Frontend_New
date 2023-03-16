// ignore_for_file: sort_child_properties_last, prefer_typing_uninitialized_variables, file_names, camel_case_types

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapeat1/provider/home_screen_provider.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/show_date_and_time_picker.dart';
import '../../../utils/slider_and_switch_widgets.dart';

class reservation_availability_screen extends StatefulWidget {
  const reservation_availability_screen({super.key});

  @override
  State<reservation_availability_screen> createState() =>
      reservation_availability_screenState();
}

class reservation_availability_screenState
    extends State<reservation_availability_screen> {
  bool togle = false;
  var date;
  var time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                cutomDatePicker(context).then((value) {
                  setState(() {
                    date = DateFormat("dd-MM-yyyy").format(value!);
                  });
                });
              },
              child: Row(
                children: [
                  Image.asset(
                    dateicon,
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  IBMPlexsansText(date == null ? DECEMBER12 : date.toString(),
                      primary, FontWeight.w500, 13),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showTime(context).then((value) {
                  setState(() {
                    time = value.format(context);
                  });
                });
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time_filled_sharp,
                    color: grey90,
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  IBMPlexsansText(time == null ? "10:30AM" : time.toString(),
                      primary, FontWeight.w500, 13),
                ],
              ),
            ),
            Consumer<home_screen_provider>(
                builder: (BuildContext context, value, Widget? child) {
              return Row(
                children: [
                  Image.asset(
                    manyPerson,
                    errorBuilder: (context, error, stackTrace) => Container(),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      value.increment();
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.add,
                        color: white,
                      ),
                      backgroundColor: primary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
                    child: IBMPlexsansText(
                        value.index.toString(), black80, FontWeight.w500, 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      value.decreement();
                    },
                    child: const CircleAvatar(
                      radius: 12,
                      child: Icon(
                        Icons.remove,
                        color: white,
                      ),
                      backgroundColor: primary,
                    ),
                  )
                ],
              );
            }),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        customSwitch(does_not_require_reservation, "", togle, (value) {
          setState(() {
            togle = value;
          });
        }),
        SizedBox(
          height: h * 0.1,
        ),
      ],
    );
  }
}
