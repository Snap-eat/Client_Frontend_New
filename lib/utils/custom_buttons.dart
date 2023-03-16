// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';

// Default login button
class DefaultButtonLogin extends StatelessWidget {
  DefaultButtonLogin({
    required this.width,
    required this.height,
    Key? key,
    required this.text,
    required this.press,
    required this.colors,
  }) : super(key: key);
  final String text;
  final Function() press;
  final double width;
  final double height;
  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: colors)),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onPressed: press,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  color: white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

// custom icon button
class Defaulttextbut extends StatelessWidget {
  const Defaulttextbut({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 20,
          color: black,
        ));
  }
}

// custom radio button with icon

Widget customRadioBtn(String url, dynamic value, dynamic groupValue,
    Function(dynamic)? onChanged, String txt) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SvgPicture.asset(url),
          SizedBox(
            width: 10,
          ),
          IBMPlexsansText(txt, black80, FontWeight.bold, 15),
        ],
      ),
      Radio(
        fillColor: MaterialStateColor.resolveWith((states) => primary),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      )
    ],
  );
}

// custiom button
Widget customBtn(double height, Function()? onPressed, Color? bcolor,
    String txt, double fontsize) {
  return MaterialButton(
    height: height,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    color: bcolor,
    onPressed: onPressed,
    child: Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child:
          Center(child: IBMPlexsansText(txt, white, FontWeight.bold, fontsize)),
    ),
  );
}

// view Map Button

Widget customButtonViewMap(Function()? onPressed, Color? bcolor,
    Color Iconcolor, String assetName, String txt, Color txtcolor) {
  return FittedBox(
    child: MaterialButton(
      height: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: bcolor,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            assetName,
            color: Iconcolor,
            height: 16,
          ),
          const SizedBox(
            width: 3,
          ),
          IBMPlexsansText(txt, txtcolor, FontWeight.w500, 12),
        ],
      ),
    ),
  );
}
