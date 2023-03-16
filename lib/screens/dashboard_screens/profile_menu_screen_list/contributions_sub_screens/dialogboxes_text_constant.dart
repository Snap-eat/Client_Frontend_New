import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_style.dart';

// FoodSnap not Approved  content
foodSnapNotApproved() => Column(
      children: [
        IBMPlexsansText(
            "Why is my FoodSnap not approved?", black60, FontWeight.bold, 13),
        SizedBox(
          height: h * 0.02,
        ),
        IBMPlexsansText(
            """ We want the best for you and for the SnapEater community, so we keep high standards for the pictures shared with the community. 

The reason we might not approve some pictures is that 
they might lack the SnapFantastic factor. 

This means the dish was not in focus, lighting was not good, or there was noise (i.e. personal belongings, objects, a hand etc.). This is the most common issue.""",
            black60,
            FontWeight.normal,
            11),
        SizedBox(
          height: h * 0.01,
        ),
      ],
    );

///I cannot see my FoodSnap in the menu  Content
foodSnapMenuContent() => Column(
      children: [
        SizedBox(
          height: h * 0.01,
        ),
        IBMPlexsansText("I cannot see my FoodSnap in the menu", black60,
            FontWeight.bold, 13),
        SizedBox(
          height: h * 0.01,
        ),
        IBMPlexsansText(
            """On some occasions, a picture that you previously uploaded might be updated with a new one. 

Your earned points will still be valid and the picture will be shown in your Contributions.

There might be a few reasons why your picture is no longer visible in the menu:

- the restaurant has requested to remove the picture 
as it’s not an up-to-date representative of the dish. Sometimes presentation might change and we want our SnapEaters to see the food as it is, before they order it. 

- a SnapEater has reported that the dish no longer looks the same.""",
            black60,
            FontWeight.normal,
            11),
        SizedBox(
          height: h * 0.01,
        ),
      ],
    );
