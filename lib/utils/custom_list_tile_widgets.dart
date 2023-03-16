// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, avoid_print, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, sort_child_properties_last, unused_import
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../component/images_constant.dart';
import '../component/text_style.dart';

//custom Divider
customDivider() {
  return Divider(
    color: grey,
    thickness: 1.2,
  );
}

// custom ListTile
customListtile(Function()? onTap, String txt) {
  return ListTile(
    dense: true,
    contentPadding: EdgeInsets.zero,
    onTap: onTap,
    hoverColor: Colors.transparent,
    selectedColor: Colors.transparent,
    leading: IBMPlexsansText(txt, black, FontWeight.w600, 14),
    trailing: Padding(
      padding: EdgeInsets.only(right: w * 0.03),
      child: Icon(
        Icons.arrow_forward_ios_sharp,
        size: 20,
        color: primary1,
      ),
    ),
  );
}
