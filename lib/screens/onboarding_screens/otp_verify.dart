// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_field, unnecessary_new, prefer_interpolation_to_compose_strings, avoid_print, sort_child_properties_last, unused_local_variable, file_names, prefer_const_literals_to_create_immutables, unused_label, body_might_complete_normally_nullable, curly_braces_in_flow_control_structures, camel_case_types, unrelated_type_equality_checks, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:snapeat1/component/navigation_routes.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/prefrences/shared_prefrences.dart';
import 'package:snapeat1/screens/onboarding_screens/enter_mobile.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:telephony/telephony.dart';
import '../../../component/images_constant.dart';
import '../../../services/auth_services/onboarding_api.dart';
import '../../component/navigator_key.dart';
import '../../utils/custom_buttons.dart';
import '../../utils/custom_loader.dart';
import '../../utils/custom_text_fields.dart';

class otp_verify extends StatefulWidget {
  static String errorMessage = "";
  var number;

  otp_verify({super.key, this.number});

  @override
  State<otp_verify> createState() => otp_verifyState();
}

class otp_verifyState extends State<otp_verify> {
  TextEditingController dicount_controller = TextEditingController();
  Telephony telephony = Telephony.instance;
  TextEditingController otpbox = TextEditingController();
  FocusNode pinFocus = FocusNode();
  bool visible = false;
  bool visiblty = false;
  Timer? _timer;
  int _start = 15;
  int tap_on_resend = 0;
  bool resend_code_visibility = true;
  @override
  void initState() {
    if (otp_verify.errorMessage.isNotEmpty) {
      _start = 0;
      resend_code_visibility = false;
      context.read<onboarding_api>().otpverificationMsg = otp_verify.errorMessage.toString();
      setState(() {});
    } else {
      if (enter_mobile.isChange) {
        startTimer();
      } else {
        setState(() {
          _start = 0;
        });
      }
    }
    super.initState();
  }

// show timer for resend otp
  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    otpbox.dispose();
    if (_timer.toString() != "null") {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    }
    super.dispose();
  }

  String verificationError = '';
  @override
  Widget build(BuildContext context) {
    final changeData = Provider.of<onboarding_api>(context);
    return Container(
      height: h * 1,
      width: w * 1,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                bakgroundimage,
              ),
              fit: BoxFit.cover)),
      child: WillPopScope(
        onWillPop: () async {
          context.read<onboarding_api>().otpverificationMsg = verificationError;
          setState(() {
            enter_mobile.isChange = false;
          });
          pustAndRemoveUntil(enter_mobile(
            dialcode: Preference.pref.getString(UserData.DIAL_CODE.toString()),
            countrycode: Preference.pref.getString(UserData.COUNTRY_CODE.toString()),
          ));
          return false;
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              // resizeToAvoidBottomInset: false,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Visibility(
                visible: visible,
                child: Padding(
                    padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
                    child: Consumer<onboarding_api>(builder: (BuildContext context, changeValue, Widget? child) {
                      return DefaultButtonLogin(
                          width: w * 1,
                          height: h * 0.065,
                          text: VERIFY,
                          press: () async {
                            if (is_validate_otp()) {
                              FocusScope.of(context).unfocus();
                              changeValue.isRegistrationOTPverify == true;
                              setState(() {});
                              await changeValue.otpVerify(otpbox.text.toString()).then((value) {
                                changeValue.isRegistrationOTPverify = false;
                                if (changeData.otpverificationMsg.isNotEmpty) {
                                  otpbox.text = "";
                                } else {
                                  changeData.otpverificationMsg = otp_verify.errorMessage.toString();
                                }
                                setState(() {});
                              });
                              changeValue.isRegistrationOTPverify = false;
                              setState(() {});
                            }
                          },
                          colors: [primary, primary_light]);
                    })),
              ),
              body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * 0.050,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                      child: Container(
                        width: 60,
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.read<onboarding_api>().otpverificationMsg = verificationError;
                            setState(() {
                              enter_mobile.isChange = false;
                            });
                            pustAndRemoveUntil(enter_mobile(
                              dialcode: Preference.pref.getString(UserData.DIAL_CODE.toString()),
                              countrycode: Preference.pref.getString(UserData.COUNTRY_CODE.toString()),
                            ));
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                            color: black,
                          ),
                        ),
                      ),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(height: h * 0.0250),

                      Padding(
                        padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
                        child: AlgeraText2(VERIY_YOUR_MOBILE_NUMBER, Colors.white, FontWeight.w500, 30),
                      ),
                      SizedBox(height: h * 0.015),

                      Padding(
                        padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
                        child: IBMPlexsans2(WE_HAVE_SENT_MAGIC_TEXT, black, FontWeight.w400, 16),
                      ),

                      SizedBox(
                        height: h * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
                        child: PinCodeTextField(
                          autoFocus: true,
                          dialogConfig: DialogConfig(),
                          textInputAction: TextInputAction.done,
                          focusNode: pinFocus,
                          enableActiveFill: true,
                          autoDisposeControllers: false,
                          enablePinAutofill: true,
                          useExternalAutoFillGroup: true,
                          controller: otpbox,
                          textStyle: GoogleFonts.ibmPlexSans(fontSize: 20, fontWeight: FontWeight.w500, color: black),
                          appContext: context,
                          length: 4,
                          obscureText: false,
                          hintCharacter: '—',
                          cursorColor: grey90,
                          hintStyle: TextStyle(color: black50),
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.circle,
                            fieldHeight: 65,
                            fieldWidth: 65,
                            activeColor: white,
                            selectedColor: white,
                            inactiveColor: white,
                            disabledColor: white,
                            activeFillColor: white,
                            selectedFillColor: white,
                            inactiveFillColor: white,
                            errorBorderColor: white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          onCompleted: (v) async {
                            changeData.isRegistrationOTPverify == true;
                            setState(() {});
                            await changeData.otpVerify(otpbox.text.toString()).then((value) {
                              changeData.isRegistrationOTPverify = false;
                              if (changeData.otpverificationMsg.isNotEmpty) {
                                otpbox.text = "";
                              } else {
                                changeData.otpverificationMsg = otp_verify.errorMessage.toString();
                              }
                              setState(() {});
                            });
                            changeData.isRegistrationOTPverify = false;
                            setState(() {});
                          },
                          onChanged: (value) {
                            setState(() {
                              pinFocus.hasFocus ? context.read<onboarding_api>().otpverificationMsg = otp_verify.errorMessage.toString() : context.read<onboarding_api>().otpverificationMsg;
                            });
                            if (value.length < 4) {
                              setState(() {
                                visible = false;
                              });
                            } else if (value.isNotEmpty && value.length > 3) {
                              setState(() {
                                visible = true;
                              });
                            }
                          },
                          beforeTextPaste: (text) {
                            return false;
                          },
                        ),
                      ),

                      Visibility(
                          visible: context.watch<onboarding_api>().otpverificationMsg != "",
                          child: Container(padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075), child: IBMPlexsans2(context.read<onboarding_api>().otpverificationMsg, red, FontWeight.w500, 15))),
                      SizedBox(
                        height: h * 0.005,
                      ),
                      _start > 0
                          ? Center(child: IBMPlexsansText("00:$_start", orange, FontWeight.w500, 21))
                          : Visibility(
                              visible: resend_code_visibility,
                              child: Center(
                                child: Consumer<onboarding_api>(builder: (BuildContext context, changedata, Widget? child) {
                                  return InkWell(
                                      onTap: () async {
                                        tap_on_resend++;
                                        setState(() {});
                                        if (tap_on_resend < 3) {
                                          changedata.isresendotp = true;
                                          setState(() {});
                                          await changedata.resendOTPApi(context).then((value) {
                                            if (context.read<onboarding_api>().resend_status_code == 200) {
                                              _start = 15;
                                              startTimer();
                                              context.read<onboarding_api>().otpverificationMsg = "";
                                              setState(() {});
                                            } else if (context.read<onboarding_api>().resend_status_code == 401) {
                                              resend_code_visibility = false;
                                              setState(() {});
                                            } else {
                                              resend_code_visibility = false;
                                              setState(() {});
                                            }
                                            changedata.isresendotp = false;
                                            setState(() {});
                                          });
                                          changedata.isresendotp = false;
                                          setState(() {});
                                        } else {
                                          resend_code_visibility = false;
                                          otp_verify.errorMessage = RESEND_CODE_ERROR_MESSAGE + " " + widget.number;
                                          print(otp_verify.errorMessage);
                                          context.read<onboarding_api>().otpverificationMsg = RESEND_CODE_ERROR_MESSAGE + " " + widget.number;
                                          setState(() {});
                                        }
                                      },
                                      child: TextUnderline(RESEND_CODE, primary1, FontWeight.w500, 21, transparent, primary1));
                                }),
                              ),
                            ),
                      SizedBox(
                        height: h * 0.01,
                      ),

                      // add discount code fuctionality
                      visiblty
                          ? Padding(
                              padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
                              child: customTextFormField((value) {}, (value) {
                                if (dicount_controller.text.isNotEmpty) {
                                  setState(() {
                                    visible = true;
                                  });
                                } else {
                                  setState(() {
                                    visible = false;
                                  });
                                }
                              },
                                  false,
                                  dicount_controller,
                                  AutofillHints.oneTimeCode,
                                  (value) {},
                                  enter_discount,
                                  GestureDetector(
                                    onTap: () {
                                      dicount_controller.clear();
                                      visiblty = false;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: greyblack,
                                    ),
                                  )),
                            )
                          : Center(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      visiblty = true;
                                    });
                                  },
                                  child: TextUnderline(HAVE_DISCOUNT_CODE, primary1, FontWeight.w500, 21, transparent, primary1)),
                            ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.020, bottom: h * 0.01, left: w * 0.06, right: w * 0.06),
                        child: Center(child: TextWithShadowIBMPlex(GET_30_REWARDSTXT, Colors.white, FontWeight.w600, 17)),
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: REDEEMABLE_ON_FIRST,
                            style: GoogleFonts.ibmPlexSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 2,
                                    color: black.withOpacity(0.3),
                                  ),
                                ],
                                color: white),
                            children: <TextSpan>[
                              TextSpan(
                                text: T_AND_C,
                                style: GoogleFonts.ibmPlexSans(fontWeight: FontWeight.w500, shadows: [Shadow(offset: Offset(0, -1), color: blue)], fontSize: 14, decorationColor: blue, decoration: TextDecoration.underline, color: transparent),
                              ),
                              TextSpan(
                                  text: FOR_FULL_DETAIL,
                                  style: GoogleFonts.ibmPlexSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 2,
                                          color: black.withOpacity(0.3),
                                        ),
                                      ],
                                      color: white)),
                            ],
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ),
            // call to Circular Progress indicator for waiting data
            changeData.isRegistrationOTPverify || changeData.isresendotp ? customLoader : Container()
          ],
        ),
      ),
    );
  }

  is_validate_otp() {
    if (otpbox.text.toString() == "" || otpbox.text.length < 4) {
      context.read<onboarding_api>().otpverificationMsg = Enter_otp_field;
      setState(() {});
      return false;
    }
    context.read<onboarding_api>().otpverificationMsg = "";
    return true;
  }
}
