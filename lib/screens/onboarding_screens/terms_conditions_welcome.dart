// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, file_names, unused_local_variable, avoid_print, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_buttons.dart';
import '../../component/navigator_key.dart';
import '../../component/text_constant_key.dart';
import '../../prefrences/shared_prefrences.dart';
import '../../services/auth_services/onboarding_api.dart';
import '../../utils/custom_loader.dart';

class terms_conditions_welcome extends StatefulWidget {
  const terms_conditions_welcome({super.key});

  @override
  State<terms_conditions_welcome> createState() => terms_conditions_welcomeState();
}

class terms_conditions_welcomeState extends State<terms_conditions_welcome> {
  bool clrchange = false;
  bool greyButtonPress = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var changeValue = Provider.of<onboarding_api>(context);
    return Stack(
      children: [
        Scaffold(
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    height: h * 1,
                    width: w * 1,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(bakgroundimage), fit: BoxFit.fill)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: h * 0.050, bottom: h * 0.020, left: w * 0.06),
                          child: Defaulttextbut(),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      AlegreyaText(WELCOME_TO_THE, white, FontWeight.w500, 37),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AlegreyaText(SNAPEAT, white, FontWeight.w500, 39),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SvgPicture.asset(
                              rIcon,
                              height: 13,
                              color: white,
                            ),
                          ),
                          AlegreyaText(COMMUNITY, white, FontWeight.w500, 39)
                        ],
                      ),
                      SizedBox(
                        height: h * 0.34,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.060),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                clrchange = !clrchange;
                                if (clrchange) {
                                  greyButtonPress = false;
                                }

                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1.8,
                                        color: clrchange
                                            ? primary1
                                            : greyButtonPress
                                                ? red
                                                : white),
                                    color: clrchange ? primary1 : Colors.transparent),
                                child: clrchange
                                    ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: white,
                                          size: 17,
                                        ),
                                      )
                                    : Text(""),
                              ),
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            SizedBox(
                              width: w * 0.8,
                              child: RichText(
                                text: TextSpan(
                                  text: BY_SIGNING_YOU,
                                  style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 13, color: white),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: TERMS_OF_USE,
                                      style: GoogleFonts.rubik(fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(0, -1), color: blue)], fontSize: 15, decorationColor: blue, decoration: TextDecoration.underline, color: transparent),
                                    ),
                                    TextSpan(text: AND),
                                    TextSpan(
                                      text: PRIVACY_POLICY,
                                      style: GoogleFonts.rubik(fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(0, -1), color: blue)], fontSize: 15, decorationColor: blue, decoration: TextDecoration.underline, color: transparent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.060, right: w * 0.060),
                        child: Consumer<onboarding_api>(builder: (BuildContext context, changeValue, Widget? child) {
                          return DefaultButtonLogin(
                              width: w * 1,
                              height: h * 0.065,
                              text: start_snap_eating,
                              press: (() async {
                                if (clrchange == true) {
                                  changeValue.isRegistrationdata = true;
                                  greyButtonPress = false;
                                  setState(() {});
                                  await changeValue.registrationApi(Preference.pref.getString(UserData.USER_EMAIL), true).then((value) {
                                    changeValue.isRegistrationdata = false;
                                    setState(() {});
                                  });
                                  changeValue.isRegistrationdata = false;
                                  setState(() {});
                                } else {
                                  setState(() {
                                    greyButtonPress = true;
                                  });
                                }
                              }),
                              colors: [clrchange ? primary1 : grey, clrchange ? primary1 : grey]);
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: h * 0.090,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              cIcon,
                              color: white,
                              height: 15,
                            ),
                            IBMPlexsansText(ALL_RIGHT_RESERVED, white, FontWeight.w500, 14),
                          ],
                        ),
                      )
                    ])))),
        // call to Circular Progress indicator for waiting data
        changeValue.isRegistrationdata ? customLoader : Container()
      ],
    );
  }
}
