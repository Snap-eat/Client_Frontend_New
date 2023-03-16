// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/utils/colors.dart';
import 'custom_buttons.dart';

// custom DilaogBox without Animation
show_dialog_with_multipal_parameters(Function()? ontap, List<Widget> children,
    [Color? Containercolor]) {
  return showDialog(
      context: navigation_service.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Containercolor,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            children: children)),
                  ),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: CircleAvatar(
                    backgroundColor: grey,
                    child: Icon(
                      Icons.clear,
                      color: black80,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

//Animated Custom Dialog View with Animation
show_dialog_with_annimation(double height, List<Widget> children) {
  showGeneralDialog(
    context: navigation_service.navigatorKey.currentContext!,
    // barrierLabel: MaterialLocalizations.of(
    //   navigation_service.navigatorKey.currentContext!,
    // ).modalBarrierDismissLabel,
    barrierLabel: MaterialLocalizations.of(
      navigation_service.navigatorKey.currentContext!,
    ).modalBarrierDismissLabel,
    barrierDismissible: true,
    useRootNavigator: true,
    barrierColor: Colors.black.withOpacity(0.7),
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: children),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

// show Custom Dialog Box
showDialogBox(List<Widget> children, [double? width]) {
  return showDialog(
      context: navigation_service.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        children: children)),
              ),
            ),
          ),
        );
      });
}

flash_dialog(Widget content, double maxWidth,
    [Function(Function())? negativeActionBuilder]) {
  navigation_service.navigatorKey.currentContext!.showFlashDialog(
    transitionDuration: Duration(milliseconds: 500),
    constraints: BoxConstraints(maxWidth: maxWidth),
    persistent: true,
    borderRadius: BorderRadius.circular(8),
    // title: AlegreyaText('Message', primary1, FontWeight.w500, 18),
    content: content,
    negativeActionBuilder: (context, controller, _) {
      return Padding(
        padding: EdgeInsets.only(top: h * 0.01, right: w * 0.05),
        child: Align(
          alignment: Alignment.centerRight,
          child: DefaultButtonLogin(
              width: w * 0.45,
              height: h * 0.04,
              text: "Save",
              press: () {
                controller.dismiss();
              },
              colors: const [primary1, primary1]),
        ),
      );
    },
    // positiveActionBuilder: (context, controller, _) {
    //   return TextButton(
    //       onPressed: () {
    //         controller.dismiss();
    //       },
    //       child: Text('YES'));
    // }
  );
}
