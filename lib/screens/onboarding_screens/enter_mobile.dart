// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, non_constant_identifier_names, unused_local_variable, file_names, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables, unused_field, prefer_interpolation_to_compose_strings, unused_element, prefer_is_empty, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_buttons.dart';
import 'package:snapeat1/utils/custom_text_fields.dart';
import '../../../component/images_constant.dart';
import '../../../component/text_constant_key.dart';
import '../../../services/auth_services/onboarding_api.dart';
import '../../component/navigator_key.dart';
import '../../prefrences/shared_prefrences.dart';
import '../../utils/custom_loader.dart';

class enter_mobile extends StatefulWidget {
  var dialcode;
  var countrycode;
  static var mobileNo = "";
  static bool isChange = false;
  enter_mobile({super.key, required this.dialcode, required this.countrycode});

  @override
  State<enter_mobile> createState() => enter_mobileState();
}

class enter_mobileState extends State<enter_mobile> {
  TextEditingController numberController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  bool showDiscountCode = false;
  bool visible = false;
  String errormsg = '';
  var countryCode = "GB";
  var dialcode = "44";

  @override
  void initState() {
    setState(() {
      if (enter_mobile.mobileNo.isNotEmpty) {
        numberController.text = enter_mobile.mobileNo.toString();
        setState(() {
          visible = true;
        });
      }
    });
    setState(() => countryCode = widget.countrycode.toString());
    setState(() => dialcode = widget.dialcode.toString());
    Preference.pref.setString(UserData.COUNTRY_CODE, widget.countrycode.toString());
    Preference.pref.setString(UserData.DIAL_CODE, widget.dialcode.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final changeValue = Provider.of<onboarding_api>(context);
    return Container(
      height: h * 1,
      width: w * 1,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(bakgroundimage), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: visible,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Consumer<onboarding_api>(builder: (BuildContext context, changeValue, Widget? child) {
              return DefaultButtonLogin(
                  width: w * 1,
                  height: h * 0.065,
                  text: buttontext,
                  press: () async {
                    if (isValidate()) {
                      if (numberController.text.isNotEmpty && numberController.text.toString() != "0") {
                        if (numberController.text.startsWith("+")) {
                          if (numberController.text.contains(dialcode)) {
                            var mobileNo = numberController.text.replaceAll(dialcode, "");
                            mobileNo = mobileNo.replaceAll("+", "");

                            setState(() {
                              changeValue.isSentOTP = true;
                            });
                            await changeValue.sendOTPApi(mobileNo, "+" + dialcode).then((value) {
                              setState(() {
                                enter_mobile.mobileNo = numberController.text;
                              });
                              showHideDiscountCode();

                              setState(() => changeValue.isSentOTP = false);
                            });
                          } else {
                            setState(() {
                              changeValue.invalidEntryMsg = ENTER_VALID_NUMBER;
                            });
                          }
                        } else if (numberController.text.startsWith("0")) {
                          var mobileNo = numberController.text.replaceFirst("0", "");

                          setState(() {
                            changeValue.isSentOTP = true;
                          });
                          await changeValue.sendOTPApi(mobileNo, "+" + dialcode).then((value) {
                            setState(() {
                              enter_mobile.mobileNo = numberController.text;
                            });
                            showHideDiscountCode();

                            setState(() => changeValue.isSentOTP = false);
                          });
                        } else {
                          setState(() {
                            changeValue.isSentOTP = true;
                          });

                          await changeValue.sendOTPApi(numberController.text, "+" + dialcode).then((value) {
                            setState(() {
                              enter_mobile.mobileNo = numberController.text;
                            });
                            showHideDiscountCode();

                            setState(() => changeValue.isSentOTP = false);
                          });
                        }
                      } else {
                        setState(() {
                          changeValue.invalidEntryMsg = ENTER_VALID_NUMBER;
                        });
                      }
                      setState(() {
                        visible = true;
                      });
                    }
                  },
                  colors: [primary, primary_light]);
            }),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 85, bottom: 22, left: 30, right: 30),
                    child: AlgeraText2(ENTER_YOUR_MOBILE_NUMBER, Colors.white, FontWeight.w500, 30),
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white),
                  child: IntlPhoneFieldPicker(
                    keyboardAppearance: Brightness.light,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    cursorColor: primary,
                    textAlignVertical: TextAlignVertical.center,
                    onCountryChanged: (value) {
                      setState(() => dialcode = value.dialCode);
                      Preference.pref.setString(UserData.COUNTRY_CODE, value.code.toString());
                      Preference.pref.setString(UserData.DIAL_CODE, value.dialCode.toString());
                    },
                    controller: numberController,
                    onSubmitted: (value) async {
                      if (isValidate()) {
                        if (numberController.text.isNotEmpty && numberController.text.toString() != "0") {
                          if (numberController.text.startsWith("+")) {
                            if (numberController.text.contains(dialcode)) {
                              var mobileNo = numberController.text.replaceAll(dialcode, "");
                              mobileNo = mobileNo.replaceAll("+", "");

                              setState(() {
                                changeValue.isSentOTP = true;
                              });
                              await changeValue.sendOTPApi(mobileNo, "+" + dialcode).then((value) {
                                setState(() {
                                  enter_mobile.mobileNo = numberController.text;
                                });
                                showHideDiscountCode();

                                setState(() => changeValue.isSentOTP = false);
                              });
                            } else {
                              setState(() {
                                changeValue.invalidEntryMsg = ENTER_VALID_NUMBER;
                              });
                            }
                          } else if (numberController.text.startsWith("0")) {
                            var mobileNo = numberController.text.replaceFirst("0", "");

                            setState(() {
                              changeValue.isSentOTP = true;
                            });
                            await changeValue.sendOTPApi(mobileNo, "+" + dialcode).then((value) {
                              setState(() {
                                enter_mobile.mobileNo = numberController.text;
                              });
                              showHideDiscountCode();

                              setState(() => changeValue.isSentOTP = false);
                            });
                          } else {
                            setState(() {
                              changeValue.isSentOTP = true;
                            });

                            await changeValue.sendOTPApi(numberController.text, "+" + dialcode).then((value) {
                              setState(() {
                                enter_mobile.mobileNo = numberController.text;
                              });
                              showHideDiscountCode();

                              setState(() => changeValue.isSentOTP = false);
                            });
                          }
                        } else {
                          setState(() {
                            changeValue.invalidEntryMsg = ENTER_VALID_NUMBER;
                          });
                        }
                        setState(() {
                          visible = true;
                        });
                      }
                    },
                    style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (numberController.text.isNotEmpty) {
                                numberController.clear();
                                visible = false;
                                context.read<onboarding_api>().invalidEntryMsg = errormsg;
                                setState(() {});
                              }
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: greyblack,
                            )),
                        hintText: "7974836228",
                        errorText: '',
                        errorStyle: TextStyle(fontSize: 0, height: 0),
                        counterText: '',
                        counterStyle: TextStyle(color: Colors.transparent, height: 0, fontSize: 0),
                        counter: Offstage(
                          offstage: true,
                        ),
                        contentPadding: EdgeInsets.only(top: h * 0.005),
                        hintStyle: TextStyle(fontSize: 20, color: greyblack, fontWeight: FontWeight.w500),
                        border: InputBorder.none),
                    initialCountryCode: widget.countrycode.toString(),
                    showDropdownIcon: true,
                    onChanged: (phone) {
                      setState(() {
                        enter_mobile.isChange = true;
                      });
                      if (phone.number.isNotEmpty) {
                        phone.number = phone.number.split("+").last.split(" ").toList().join().split("-").toList().join();

                        visible = true;
                        setState(() {
                          context.read<onboarding_api>().invalidEntryMsg = "";
                        });
                      } else {
                        visible = false;
                        setState(() {});
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: context.watch<onboarding_api>().invalidEntryMsg != "",
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: IBMPlexsansText(context.read<onboarding_api>().invalidEntryMsg, red, FontWeight.w400, 18),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                showDiscountCode
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: customTextFormField((value) {}, (value) {
                          if (discountController.text.isNotEmpty) {
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
                            discountController,
                            AutofillHints.telephoneNumber,
                            (value) {},
                            enter_discount,
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: GestureDetector(
                                onTap: () {
                                  discountController.clear();
                                  showDiscountCode = false;
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.cancel,
                                  color: greyblack,
                                ),
                              ),
                            )),
                      )
                    : Center(
                        child: InkWell(
                            onTap: () {
                              showDiscountCode = true;
                              setState(() {});
                            },
                            child: TextUnderline(HAVE_DISCOUNT_CODE, primary1, FontWeight.w500, 21, transparent, primary1)),
                      ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.04, bottom: h * 0.01, left: 30, right: 30),
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
              ]),
            ),
            // call to Circular Progress indicator for waiting data
            changeValue.isSentOTP ? customLoader : Container()
          ],
        ),
        // ),
      ),
    );
  }

//  create a function for validate mobileNumber
  isValidate() {
    if (numberController.text.toString() == "") {
      context.read<onboarding_api>().invalidEntryMsg = PLEASE_ENTER_FULL_NUMBER;
      setState(() {});
      return false;
    } else if (numberController.text.length < 6) {
      context.read<onboarding_api>().invalidEntryMsg = INCOMPLETE_NUMBER;
      setState(() {});
      return false;
    }
    context.read<onboarding_api>().invalidEntryMsg = "";
    return true;
  }

// create function for discount code fuctionalty
  showHideDiscountCode() {
    if (discountController.text == "") {
      showDiscountCode = false;
      setState(() {});
    } else if (discountController.text != "") {
      showDiscountCode = true;
      setState(() {});
    }
  }
}
