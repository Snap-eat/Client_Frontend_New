// ignore_for_file: file_names, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/Utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';

class schedule_for_later_bottom_sheet extends StatefulWidget {
  const schedule_for_later_bottom_sheet({super.key});
  @override
  State<schedule_for_later_bottom_sheet> createState() =>
      schedule_for_later_bottom_sheetState();
}

class schedule_for_later_bottom_sheetState
    extends State<schedule_for_later_bottom_sheet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: h * 0.33,
          width: w * 0.3,
          child: ListWheelScrollView(
              squeeze: 1.0,
              itemExtent: 40,
              diameterRatio: 1.4,
              physics: FixedExtentScrollPhysics(),
              overAndUnderCenterOpacity: 0.4,
              children: [
                IBMPlexsansText(Today, black, FontWeight.bold, 20),
                IBMPlexsansText(Tomorrow, black, FontWeight.bold, 20),
              ],
              onSelectedItemChanged: (index) {}),
        ),
        SizedBox(
            height: h * 0.33,
            width: w * 0.14,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              diameterRatio: 1.4,
              physics: FixedExtentScrollPhysics(),
              overAndUnderCenterOpacity: 0.4,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List.generate(
                    24,
                    (index) => IBMPlexsansText(
                        "${index + 1}", black, FontWeight.bold, 20)),
              ),
              onSelectedItemChanged: (index) {},
            )),
        SizedBox(
            height: h * 0.33,
            width: w * 0.14,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              diameterRatio: 1.4,
              physics: FixedExtentScrollPhysics(),
              overAndUnderCenterOpacity: 0.4,
              childDelegate: ListWheelChildLoopingListDelegate(
                  children: List.generate(
                      60,
                      (index) => IBMPlexsansText(
                          "${index + 1}", black, FontWeight.bold, 20))),
              onSelectedItemChanged: (intdex) {},
            )),
      ],
    );
  }
}
