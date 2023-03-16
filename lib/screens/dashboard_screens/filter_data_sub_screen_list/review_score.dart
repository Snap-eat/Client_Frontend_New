// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_style.dart';
import '../../../utils/slider_and_switch_widgets.dart';

class review_score extends StatefulWidget {
  const review_score({super.key});

  @override
  State<review_score> createState() => review_scoreState();
}

class review_scoreState extends State<review_score> {
  double distanseStart = 0;
  double distanseEnd = 10;
  double _startValue = 0;
  double _endValue = 10;
  double hyst = 0;
  double hyed = 10;
  double _priceStart = 0;
  double _priceend = 100.0;
  double dest = 0;
  double deed = 5;
  double mindest = 0;
  double mindeed = 5;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.005),
          child: Row(children: [
            sliderValueButton([
              IBMPlexsansText(
                  "${distanseStart.toInt()} - ${distanseEnd.toInt()} miles",
                  grey90,
                  FontWeight.w500,
                  15)
            ]),
          ]),
        ),

        // call to custom slider
        customSlider(0.0, 10.0, distanseStart, distanseEnd, (values) {
          setState(() {
            distanseStart = values.start;
            distanseEnd = values.end;
          });
        }, "1", "30 miles"),
        SizedBox(
          height: h * 0.03,
        ),
        AlegreyaText(REVIEW_SCORE, black, FontWeight.w700, 21),
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.005),
          child: Row(children: [
            sliderValueButton([
              SvgPicture.asset(starIcon),
              SizedBox(
                width: 10,
              ),
              IBMPlexsansText("${_startValue.toInt()} - ${_endValue.toInt()}",
                  grey90, FontWeight.w500, 15)
            ]),
          ]),
        ),

        // call to custom slider

        customSlider(0.0, 10.0, _startValue, _endValue, (values) {
          setState(() {
            _startValue = values.start;
            _endValue = values.end;
          });
        }, "1", "10"),
        SizedBox(
          height: h * 0.03,
        ),
        AlegreyaText(PRICE, black, FontWeight.w700, 21),
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.005),
          child: Row(children: [
            sliderValueButton([
              IBMPlexsansText(
                  "£${_priceStart.toInt()} - £${_priceend.toInt()} ",
                  grey90,
                  FontWeight.w500,
                  15)
            ]),
          ]),
        ),

        // call to custom slider

        customSlider(0.0, 100.0, _priceStart, _priceend, (values) {
          setState(() {
            _priceStart = values.start;
            _priceend = values.end;
          });
        }, "1", "10"),
        SizedBox(
          height: h * 0.03,
        ),
        AlegreyaText(HYGIENE_RATING, black, FontWeight.w700, 21),
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.005),
          child: Row(children: [
            sliderValueButton([
              SvgPicture.asset(starIcon),
              SizedBox(
                width: 10,
              ),
              IBMPlexsansText("${hyst.toInt()} - ${hyed.toInt()}", grey90,
                  FontWeight.w500, 15)
            ])
          ]),
        ),

        // call to custom slider

        customSlider(0.0, 10.0, hyst, hyed, (values) {
          setState(() {
            hyst = values.start;
            hyed = values.end;
          });
        }, "0", "10"),
        SizedBox(
          height: h * 0.03,
        ),
        AlegreyaText(DELIVERY_FEE, black, FontWeight.w700, 21),
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.005),
          child: Row(children: [
            sliderValueButton([
              IBMPlexsansText(
                  "Free - £${deed.toInt()}", grey90, FontWeight.w500, 15)
            ]),
          ]),
        ),

        // call to custom slider

        customSlider(0.0, 5.0, dest, deed, (values) {
          setState(() {
            dest = values.start;
            deed = values.end;
          });
        }, "Free", "£5+"),
        SizedBox(
          height: h * 0.03,
        ),
        AlegreyaText(MIN_ORDER_VALUE, black, FontWeight.w700, 21),
        Padding(
          padding: EdgeInsets.symmetric(vertical: h * 0.005),
          child: Row(
            children: [
              sliderValueButton([
                IBMPlexsansText("£${mindest.toInt()} - £${mindeed.toInt()}",
                    grey90, FontWeight.w500, 15)
              ]),
            ],
          ),
        ),
        // call to custom slider

        customSlider(0.0, 15.0, mindest, mindeed, (values) {
          setState(() {
            mindest = values.start;
            mindeed = values.end;
          });
        }, "£0", "£15"),
      ],
    );
  }
}
