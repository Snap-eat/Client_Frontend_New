// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_print, file_names, prefer_const_constructors_in_immutables, camel_case_types
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/navigation_routes.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/prefrences/shared_prefrences.dart';
import 'package:snapeat1/utils/colors.dart';
import 'dart:async';
import '../../../component/images_constant.dart';
import '../../component/navigator_key.dart';
import '../../utils/custom_text_fields.dart';
import 'enter_mobile.dart';

class registration_text_animation extends StatefulWidget {
  const registration_text_animation({super.key});
  @override
  State<registration_text_animation> createState() => registration_text_animationState();
}

class registration_text_animationState extends State<registration_text_animation> {
  var countryCode = "GB";
  var dialcode = "44";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: h * 1,
              width: w * 1,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(spleshbackground), fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.070,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: h * 0.1,
                    ),
                    SlideFadeTransition(
                        delayStart: const Duration(milliseconds: 400),
                        child: Text(
                          LOREM_IPSUM,
                          style: GoogleFonts.alegreyaSans(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            shadows: <Shadow>[
                              Shadow(offset: Offset(4, 4), blurRadius: 40.0, color: white),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SlideFadeTransition(
                        delayStart: const Duration(milliseconds: 800),
                        child: Text(
                          LOREM_IPSUM,
                          style: GoogleFonts.alegreyaSans(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            shadows: <Shadow>[
                              Shadow(offset: Offset(4, 4), blurRadius: 40.0, color: white),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SlideFadeTransition(
                        delayStart: const Duration(milliseconds: 1200),
                        child: Text(
                          LOREM_IPSUM,
                          style: GoogleFonts.alegreyaSans(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            shadows: <Shadow>[
                              Shadow(offset: Offset(4, 4), blurRadius: 40.0, color: white),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SlideFadeTransition(
                        delayStart: const Duration(milliseconds: 1600),
                        child: Text(
                          LOREM_IPSUM,
                          style: GoogleFonts.alegreyaSans(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            shadows: <Shadow>[
                              Shadow(offset: Offset(4, 4), blurRadius: 40.0, color: white),
                            ],
                          ),
                        )),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SlideFadeTransition(
                  delayStart: const Duration(milliseconds: 2000),
                  child: IntlPhoneFieldPicker(
                    readOnly: true,
                    showCursor: false,
                    onCountryChanged: (code) {
                      setState(() => countryCode = code.code);
                      setState(() => dialcode = code.dialCode);
                      Preference.pref.setString(UserData.COUNTRY_CODE, code.code.toString());
                      Preference.pref.setString(UserData.DIAL_CODE, code.dialCode.toString());
                    },
                    onTap: () {
                      pustAndRemoveUntil(enter_mobile(
                        dialcode: dialcode,
                        countrycode: countryCode,
                      ));
                    },
                    textInputAction: TextInputAction.continueAction,
                    invalidNumberMessage: '',
                    cursorColor: primary1,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      isDense: true,
                      labelText: ENTER_YOUR_MOBILE_NUMBER,
                      floatingLabelStyle: TextStyle(color: transparent, fontSize: 0, overflow: TextOverflow.visible),
                      labelStyle: TextStyle(color: greyblack, fontSize: 16),
                      fillColor: white,
                      filled: true,
                      errorText: '',
                      errorStyle: TextStyle(fontSize: 0, height: 0),
                      hintText: ENTER_YOUR_MOBILE_NUMBER,
                      hintStyle: TextStyle(color: grey90, fontSize: 16),
                      counter: Offstage(
                        offstage: true,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide(color: white, width: 0), borderRadius: BorderRadius.circular(8)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: white, width: 0), borderRadius: BorderRadius.circular(8)),
                      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: white, width: 0), borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: white, width: 0), borderRadius: BorderRadius.circular(8)),
                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: white, width: 0), borderRadius: BorderRadius.circular(8)),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: white, width: 0), borderRadius: BorderRadius.circular(8)),
                    ),
                    initialCountryCode: 'GB', //default contry code, NP for Nepal
                    onChanged: (phone) {},
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}

// create the class for use text Animation one by one
enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final double offset;
  final Curve curve;
  final Direction direction;
  final Duration delayStart;
  final Duration animationDuration;
  SlideFadeTransition({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 5),
    this.animationDuration = const Duration(milliseconds: 800),
  });
  @override
  // ignore: library_private_types_in_public_api
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition> with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;
  late AnimationController _animationController;
  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    if (widget.direction == Direction.vertical) {
      _animationSlide = Tween<Offset>(begin: Offset(0, widget.offset), end: Offset(0, 0)).animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    } else {
      _animationSlide = Tween<Offset>(begin: Offset(widget.offset, 0), end: Offset(0, 0)).animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    }
    _animationFade = Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      curve: widget.curve,
      parent: _animationController,
    ));
    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}
