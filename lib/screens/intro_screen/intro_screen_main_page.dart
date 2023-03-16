// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables, file_names, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../component/images_constant.dart';
import '../../component/navigation_routes.dart';
import '../../component/navigator_key.dart';
import '../../component/text_style.dart';
import '../onboarding_screens/registration_text_animation.dart';
import 'intro_text_&_images_list.dart';

class intro_screen_main_page extends StatefulWidget {
  const intro_screen_main_page({super.key});

  @override
  State<intro_screen_main_page> createState() => _intro_screen_main_pageState();
}

class _intro_screen_main_pageState extends State<intro_screen_main_page> {
  int presentpage = 0;

  List<double> padding = [5, 10, 5, 15, 5, 10, 5, 10, 15];
  PageController pageController = PageController();
  Duration pageTurnDuration = Duration(milliseconds: 500);
  Curve pageTurnCurve = Curves.ease;

  void _goForward() {
    pageController.nextPage(duration: pageTurnDuration, curve: pageTurnCurve);
  }

  void _goBack() {
    pageController.previousPage(duration: pageTurnDuration, curve: pageTurnCurve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Stack(
          // alignment: n gAlignmentDirectional.bottomCenter,
          children: [
            GestureDetector(
              onHorizontalDragEnd: (dragEndDetails) {
                if (dragEndDetails.primaryVelocity! < 0) {
                  // Page forwards
                  if (presentpage < 8) {
                    _goForward();
                  } else if (presentpage == 8) {
                    replaceRoute(registration_text_animation());
                  }
                } else if (dragEndDetails.primaryVelocity! > 0) {
                  // Page backwards
                  if (presentpage != 0) {
                    _goBack();
                  }
                }
              },
              child: Container(
                width: w * 1,
                height: h * 0.74,
                color: white,
                child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    allowImplicitScrolling: false,
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    itemCount: page.length,
                    onPageChanged: (index1) {
                      setState(() {
                        presentpage = index1;
                      });
                    },
                    itemBuilder: (context, index) {
                      return page.elementAt(index);
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: w * 0.035, right: w * 0.06, top: h * 0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  presentpage == 0
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
                          },
                          child: CircleAvatar(
                            backgroundColor: greyblack.withOpacity(0.3),
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              size: 20,
                              color: presentpage == 4
                                  ? white
                                  : presentpage == 5
                                      ? white
                                      : presentpage == 6
                                          ? white
                                          : presentpage == 8
                                              ? white
                                              : black,
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.004),
                    child: GestureDetector(
                        onTap: () {
                          replaceRoute(registration_text_animation());
                        },
                        child: Text(
                          SKIP,
                          style: GoogleFonts.ibmPlexSans(fontSize: 21, fontWeight: FontWeight.w500, color: orange, shadows: [
                            BoxShadow(
                                color: black.withOpacity(0.5),
                                offset: Offset(
                                  10,
                                  10,
                                ),
                                blurRadius: 30)
                          ]),
                        )),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: w * 1,
                height: h * 0.37,
                child: Image.asset(
                  presentpage % 2 == 1 ? intro_image6 : intro_image3,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: h * 0.35,
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w * 0.7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(
                                  page.length,
                                  (index) => Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 250),
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: white, blurRadius: presentpage == index ? 5 : 0)], borderRadius: BorderRadius.circular(10), color: presentpage == index ? white : grey),
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: w * 0.02),
                            child: GestureDetector(
                              child: SvgPicture.asset(
                                presentpage == 8 ? endIcon : NextIcon,
                              ),
                              onTap: () {
                                if (presentpage < 8) {
                                  pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.linear);
                                }
                                if (presentpage == 8) {
                                  pushTo(registration_text_animation());
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: padding[presentpage]),
                        child: AlegreyaText(intrichief[presentpage]["text1"], white, FontWeight.w500, presentpage == 3 ? 30 : 26),
                      ),
                      SizedBox(
                        height: h * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: padding[presentpage]),
                        child: AlegreyaText(intrichief[presentpage]["text2"], white, FontWeight.w500, 18),
                      ),
                      SizedBox(
                        width: w * 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: w * 0.15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              presentpage == 1 ? AlegreyaText(LOREM_IPSUM, white, FontWeight.w500, 18) : Text(""),
                              SizedBox(
                                width: w * 0.15,
                              ),
                              presentpage == 1 ? Align(alignment: Alignment.centerRight, child: Image.asset(icon3D)) : Container()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
