// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/utils/colors.dart';

// shadow with IBMPlesSans Text
Widget TextWithShadowIBMPlex(String txt, Color color, FontWeight? fontWeight, double? fontSize) {
  return Text(txt,
      textAlign: TextAlign.center,
      style: GoogleFonts.ibmPlexSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: black.withOpacity(0.4),
          ),
        ],
      ));
}

/// shadow with AlgeraSans text
Widget TextWithShadowAlegreya(String txt, Color color, FontWeight? fontWeight, double? fontSize) {
  return Text(txt,
      textAlign: TextAlign.center,
      style: GoogleFonts.alegreyaSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(2, 1.0),
            blurRadius: 3.0,
            color: black80.withOpacity(0.3),
          ),
        ],
      ));
}

// IBMPlexSans fontFamily text with center Aligment
Widget IBMPlexsansText(String txt, Color color, FontWeight? fontWeight, double? fontSize) {
  return Text(txt,
      textAlign: TextAlign.center,
      style: GoogleFonts.ibmPlexSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ));
}

// IBMPlexSans fontFamily text with start Aligment
Widget IBMPlexsans2(String txt, Color color, FontWeight? fontWeight, double? fontSize) {
  return Text(txt,
      style: GoogleFonts.ibmPlexSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ));
}

// ALgeraSans Fontfamily text with center Alignment
Widget AlegreyaText(String txt, Color color, FontWeight? fontWeight, double? fontSize) {
  return Text(txt,
      textAlign: TextAlign.center,
      style: GoogleFonts.alegreyaSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ));
}

// text with  start Alignment
Widget AlgeraText2(String txt, Color color, FontWeight? fontWeight, double? fontSize) {
  return Text(txt,
      style: GoogleFonts.alegreyaSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ));
}

//   Text  with   Underline   with ibmPlexSans font family
Widget TextUnderline(String txt, Color offsetColor, FontWeight? fontWeight, double? fontSize, Color txtColor, Color underlineColor) {
  return Text(
    txt,
    style: GoogleFonts.ibmPlexSans(
        color: txtColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: [Shadow(offset: Offset(0, -2), color: offsetColor)],
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1,
        decorationColor: underlineColor,
        decoration: TextDecoration.underline),
  );
}
