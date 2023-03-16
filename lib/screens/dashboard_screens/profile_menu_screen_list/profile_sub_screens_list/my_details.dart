// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_style.dart';
import '../../../../provider/home_screen_provider.dart';
import '../../../../utils/app_bar_widgets.dart';
import '../../../../utils/custom_buttons.dart';
import '../../../../utils/custom_text_fields.dart';
import '../../../../utils/dialog_box_widgets.dart';
import '../../../../utils/slider_and_switch_widgets.dart';

TextEditingController mobileController = TextEditingController();
TextEditingController emailController = TextEditingController();

class my_details extends StatefulWidget {
  const my_details({super.key});

  @override
  State<my_details> createState() => my_detailsState();
}

class my_detailsState extends State<my_details> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar(""),
      body: Padding(
        padding:
            EdgeInsets.only(left: w * 0.045, right: w * 0.03, bottom: h * 0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AlegreyaText(MY_DETAILS, black, FontWeight.w500, 30),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Consumer<home_screen_provider>(builder:
                          (BuildContext context, value, Widget? child) {
                        return GestureDetector(
                          onTap: () {},
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              CircleAvatar(
                                radius: h * 0.065,
                                backgroundColor: white,
                                child: CircleAvatar(
                                    radius: h * 0.055,
                                    backgroundImage:
                                        const AssetImage(userImage)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: white,
                                  child: CircleAvatar(
                                    radius: 15,
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: white,
                                      size: 20,
                                    ),
                                    backgroundColor: primary1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.only(
                          left: w * 0.01,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AlegreyaText(
                                ELIZABATH, black, FontWeight.normal, 20),
                            AlegreyaText(CHANGE_DISPLAY_NAME, primary1,
                                FontWeight.normal, 15)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DefaultTFField(
                nameController,
                (value) {},
                ELIZABATH_SIMPOSANS,
                IBMPlexsansText(NAME, black50, FontWeight.normal, 14),
                Text(""),
                TextStyle(color: black, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: customCuntryCodePicker(
                      mobileController,
                      HINT,
                      HINT,
                      transparent,
                      GestureDetector(
                          onTap: () {
                            show_dialog_with_multipal_parameters(() {
                              Navigator.pop(context);
                            }, [MobileVerify()], Colors.transparent);
                          },
                          child: IBMPlexsansText(
                              VERIFIED, primary, FontWeight.normal, 15)))),
              SizedBox(
                height: h * 0.01,
              ),
              DefaultTFField(
                emailController,
                (value) {},
                ELIZABATH_EMAIL,
                IBMPlexsansText(EMAIL, black50, FontWeight.normal, 14),
                GestureDetector(
                    onTap: () {
                      show_dialog_with_multipal_parameters(() {
                        Navigator.pop(context);
                      }, [EmailVerfy()], Colors.transparent);
                    },
                    child: IBMPlexsansText(
                        VERIFY_NOW, orange, FontWeight.normal, 14)),
                TextStyle(color: black, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              DefaultTFField(
                userNameController,
                (value) {},
                ENTER_YOUR_USERNAME,
                Image.asset(instagramIcon),
                GestureDetector(
                    onTap: () {
                      show_dialog_with_annimation(
                          h * 0.45, [DialogforUserName()]);
                    },
                    child: SvgPicture.asset(thinkIcon)),
              ),
              customSwitch(ARE_YOU_FOOD_BLOGGER, "", isSwitch, (value) {
                isSwitch = value;
                setState(() {});
              }, Colors.transparent),
              IBMPlexsansText(bloggerTxt, orange, FontWeight.normal, 13),
              SizedBox(
                height: h * 0.02,
              ),
              DefaultButtonLogin(
                  width: w * 1,
                  height: h * 0.065,
                  text: SAVE_CHANGES,
                  press: () {},
                  colors: [primary_light, primary])
            ],
          ),
        ),
      ),
    );
  }
}

// email verify on email section dialog box
class EmailVerfy extends StatelessWidget {
  EmailVerfy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: h * 0.4,
        ),
        DefaultTFField(
          emailController,
          (value) {},
          ELIZABATH_EMAIL,
          IBMPlexsansText(EMAIL, black50, FontWeight.normal, 14),
          IBMPlexsansText(UN_VERIFY, orange, FontWeight.normal, 14),
          TextStyle(color: black, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: h * 0.3,
        ),
        DefaultButtonLogin(
            width: w * 1,
            height: h * 0.07,
            text: VERIFY_EMAIL,
            press: () {
              Navigator.pop(context);
            },
            colors: [primary_light, primary])
      ],
    );
  }
}

// mobile  verify on email section dialog box
class MobileVerify extends StatelessWidget {
  MobileVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: h * 0.4,
        ),
        Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: grey),
                borderRadius: BorderRadius.circular(8)),
            child: customCuntryCodePicker(
                mobileController,
                "79579 67 256",
                "79579 67 256",
                transparent,
                GestureDetector(
                    onTap: () {
                      show_dialog_with_multipal_parameters(() {
                        Navigator.pop(context);
                      }, [], Colors.transparent);
                    },
                    child: IBMPlexsansText(
                        UN_VERIFY, primary, FontWeight.normal, 15)))),
        SizedBox(
          height: h * 0.3,
        ),
        DefaultButtonLogin(
            width: w * 1,
            height: h * 0.07,
            text: VERIFY_MOBILE_NUMBER,
            press: () {
              Navigator.pop(context);
            },
            colors: [primary, primary_light])
      ],
    );
  }
}

//  Dilalog for userName

class DialogforUserName extends StatelessWidget {
  const DialogforUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          IBMPlexsansText(
              FOOD_BLOGGER_CONTANTS, black50, FontWeight.normal, 14),
          IBMPlexsansText(
              EXAMPLE_SHOW_ON_PICTURE, black50, FontWeight.normal, 14),
          Padding(
            padding: EdgeInsets.only(top: h * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IBMPlexsansText(PHOTO_CREDIT, black, FontWeight.normal, 16),
                    Row(
                      children: [
                        Image.asset(instagramIcon),
                        IBMPlexsansText(
                            FOOD_BLOGGER, black, FontWeight.normal, 18),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IBMPlexsansText(PHOTO_CREDIT, black, FontWeight.normal, 16),
                    Row(
                      children: [
                        Image.asset(
                          userImage,
                          height: 30,
                        ),
                        IBMPlexsansText(
                            FOOD_BLOGGER, black, FontWeight.normal, 18),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
