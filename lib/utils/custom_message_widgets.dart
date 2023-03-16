// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
// import 'package:flash/flash.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../component/navigator_key.dart';

// custom dialog box with flash

flash_message(String txt, {bool persistent = true}) {
  navigation_service.navigatorKey.currentContext!.showFlashDialog(
    transitionDuration: Duration(milliseconds: 500),
    constraints: BoxConstraints(maxWidth: 300),
    persistent: persistent,
    title: AlegreyaText('Message', primary1, FontWeight.w500, 18),
    content: AlegreyaText(txt, red, FontWeight.w400, 15),
    // negativeActionBuilder: (context, controller, _) {
    //   return TextButton(
    //     onPressed: () {
    //       controller.dismiss();
    //     },
    //     child: Text('NO'),
    //   );
    // },
    // positiveActionBuilder: (context, controller, _) {
    //   return TextButton(
    //       onPressed: () {
    //         controller.dismiss();
    //       },
    //       child: Text('YES'));
    // }
  );
}

//  custom Snackbar message
customSnackbar(
  String txt,
) {
  ScaffoldMessenger.of(navigation_service.navigatorKey.currentContext!)
      .showSnackBar(SnackBar(
          margin: EdgeInsets.only(
              left: w * 0.045, right: w * 0.045, bottom: h * 0.06),
          duration: Duration(milliseconds: 1000),
          backgroundColor: primary1,
          behavior: SnackBarBehavior.floating,
          content: Text(
            txt.toString(),
            style: GoogleFonts.alegreyaSans(color: white, fontSize: 17),
          )));
}

// custom error snacbar message
errorSnackbar(
  String txt,
) {
  ScaffoldMessenger.of(navigation_service.navigatorKey.currentContext!)
      .showSnackBar(SnackBar(
          margin: EdgeInsets.only(
              left: w * 0.045, right: w * 0.045, bottom: h * 0.06),
          duration: Duration(milliseconds: 1000),
          backgroundColor: red,
          behavior: SnackBarBehavior.floating,
          content: Text(
            txt.toString(),
            style: GoogleFonts.alegreyaSans(color: white, fontSize: 17),
          )));
}

// flutter toast message

custom_toast_message(String message) {
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: primary,
      textColor: white,
      fontSize: 16.0);
}
