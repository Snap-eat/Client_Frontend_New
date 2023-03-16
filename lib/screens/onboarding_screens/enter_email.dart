// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors, prefer_typing_uninitialized_variables, file_names, avoid_print, unused_local_variable, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, unused_field, camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_buttons.dart';
import 'package:snapeat1/utils/custom_text_fields.dart';
import 'package:snapeat1/utils/email_validation_widget.dart';
import '../../../component/images_constant.dart';
import '../../../component/text_constant_key.dart';
import '../../../services/auth_services/onboarding_api.dart';
import '../../utils/custom_loader.dart';

class enter_email extends StatefulWidget {
  const enter_email({super.key});
  @override
  State<enter_email> createState() => enter_emailState();
}

class enter_emailState extends State<enter_email> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailControlller = TextEditingController();
  bool visible = false;
  bool showError = false;
  bool changeColor = false;
  String emailValidationError = '';

  // bool emailValid =
  //     RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch();

  @override
  Widget build(BuildContext context) {
    final changeData = Provider.of<onboarding_api>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        context.read<onboarding_api>().registrationMsg = emailValidationError;
        setState(() {});
        return false;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: visible,
          child: Padding(
            padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
            child: Consumer<onboarding_api>(builder: (BuildContext context, changeValue, Widget? child) {
              return DefaultButtonLogin(
                  width: w * 1,
                  height: h * 0.065,
                  text: buttontext,
                  press: () async {
                    if (_formKey.currentState!.validate() && changeColor == true) {
                      changeValue.isRegistrationdata = true;
                      setState(() {});
                      await changeValue.registrationApi(emailControlller.text.toString(), false).then((value) {
                        changeValue.isRegistrationdata = false;
                        setState(() {});
                      });
                      emailValidationError = changeValue.registrationMsg;
                      changeValue.isRegistrationdata = false;
                      setState(() {});
                    }
                  },
                  colors: changeColor ? [primary, primary_light] : [grey, grey]);
            }),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    height: h * 1,
                    width: w * 1,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(bakgroundimage), fit: BoxFit.cover)),
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.075, right: w * 0.075),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(
                          height: h * 0.060,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<onboarding_api>().registrationMsg = "";
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 20,
                                    color: black,
                                  ),
                                ))),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          AlgeraText2(WHATS_YOUR_EMAIL_ADDRESS, white, FontWeight.w500, 29),
                          SizedBox(
                            height: h * 0.035,
                          ),
                          customTextFormField(
                            (value) async {
                              final changeValue = Provider.of<onboarding_api>(context);
                              if (_formKey.currentState!.validate() && changeColor == true) {
                                changeValue.isRegistrationdata = true;
                                setState(() {});
                                await changeValue.registrationApi(emailControlller.text.toString(), false).then((value) {
                                  changeValue.isRegistrationdata = false;
                                  setState(() {});
                                });
                                emailValidationError = changeValue.registrationMsg;
                                changeValue.isRegistrationdata = false;
                                setState(() {});
                              }
                            },
                            (value) {
                              setState(() {
                                context.read<onboarding_api>().registrationMsg = "";
                              });
                              if (emailControlller.text.isNotEmpty) {
                                setState(() {
                                  visible = true;
                                  changeColor = false;
                                });

                                if (emailPattern.hasMatch(emailControlller.text)) {
                                  changeColor = true;
                                  setState(() {});
                                }
                              } else {
                                setState(() {
                                  visible = false;
                                  changeColor = false;
                                });
                              }
                            },
                            false,
                            emailControlller,
                            AutofillHints.email,
                            (value) {
                              if (value!.isEmpty) {
                                context.read<onboarding_api>().registrationMsg = PLEASE_ENTER_EMAIL;
                                setState(() {});
                                return "";
                              } else {
                                context.read<onboarding_api>().registrationMsg = "";
                              }
                            },
                            EnterEmail,
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Visibility(
                            visible: context.watch<onboarding_api>().registrationMsg != "",
                            child: IBMPlexsansText(context.read<onboarding_api>().registrationMsg, red, FontWeight.w400, 16),
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                        ]),
                      ]),
                    ),
                  ),
                ),
              ),

              // call to Circular Progress indicator for waiting data
              changeData.isRegistrationdata ? customLoader : Container()
            ],
          ),
        ),
      ),
    );
  }
}
