// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';

List lst = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

demo() => Column(
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                lst.length,
                (index) => Padding(
                      padding: EdgeInsets.only(
                          top: h * 0.005, bottom: h * 0.005, right: w * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IBMPlexsansText(
                              lst[index], grey90, FontWeight.w500, 14),
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: grey)),
                            child: IBMPlexsansText(
                                "8pm - 10pm", black, FontWeight.w500, 14),
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: primary,
                            child: Icon(
                              Icons.add,
                              color: white,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ))),
      ],
    );
