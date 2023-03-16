// ignore_for_file: prefer_typing_uninitialized_variables, file_names, prefer_const_constructors, unnecessary_null_comparison, avoid_print, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, camel_case_types, unused_element
import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:snapeat1/component/navigation_routes.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../component/images_constant.dart';
import '../../component/navigator_key.dart';
import '../../prefrences/get_data_from_shared_prefrences.dart';
import '../bottom_navbar/bottom_navbar.dart';
import '../intro_screen/intro_screen_main_page.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});
  @override
  State<splash_screen> createState() => splash_screenState();
}

class splash_screenState extends State<splash_screen> {
  double opacityLevel = 0.0;
  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 1.0 ? 0.0 : 1.0);
  }

  bool showlogo = false;

  @override
  @mustCallSuper
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () => setState(() => showlogo = true));
    Future.delayed(const Duration(milliseconds: 1200), () {
      _changeOpacity();
      Future.delayed(const Duration(milliseconds: 1700), () {
        if (GetData.terms_condition.toString() != null && GetData.terms_condition.toString() == "true") {
          pustAndRemoveUntil(
            const bottom_navbar(),
          );
        } else {
          replaceRoute(
            const intro_screen_main_page(),
          );
        }
      });
    });
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          height: h * 1,
          width: w * 1,
          child: AnimateGradient(
              reverse: false,
              duration: Duration(milliseconds: 3400),
              primaryBegin: Alignment.topRight,
              primaryEnd: Alignment.topRight,
              secondaryBegin: Alignment.bottomLeft,
              secondaryEnd: Alignment.center,
              primaryColors: const [primary_light, primary_light, primary],
              secondaryColors: const [orange, orange, red],
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Stack(alignment: Alignment.center, children: [
                    //   Visibility(
                    //     visible: showlogo,
                    //     child: Center(
                    //       child: Container(
                    //           height: 75,
                    //           width: 75,
                    //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    //           child: AnimateGradient(
                    //             reverse: false,
                    //             duration: Duration(milliseconds: 4000),
                    //             primaryBegin: Alignment.topRight,
                    //             primaryEnd: Alignment.topRight,
                    //             secondaryBegin: Alignment.bottomLeft,
                    //             secondaryEnd: Alignment.center,
                    //             primaryColors: const [primary_light, primary_light, primary],
                    //             secondaryColors: const [orange, orange, red],
                    //           )),
                    //     ),
                    //   ),
                    //   Center(child: Image.asset(splashLogo, height: h * 0.13))
                    // ]),

                    Center(child: Image.asset(splashLogo, height: h * 0.13)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          SNAP,
                          style: GoogleFonts.alice(fontSize: 70, color: white, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, height: 0.95),
                        ),
                        Stack(
                          children: [
                            GradientText(
                              EAT,
                              gradientType: GradientType.linear,
                              gradientDirection: GradientDirection.ttb,
                              colors: [orange, red],
                              style: GoogleFonts.alice(fontSize: 70, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: white, height: 0.95),
                            ),
                            AnimatedOpacity(
                                opacity: opacityLevel,
                                duration: const Duration(milliseconds: 1800),
                                child: GradientText(EAT,
                                    gradientType: GradientType.linear,
                                    gradientDirection: GradientDirection.ttb,
                                    colors: [primary_light, primary],
                                    style: GoogleFonts.alice(fontSize: 70, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: white, height: 0.95)))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.008),
                          child: Container(height: 20, width: 20, decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage(rIcon)))),
                        )
                      ],
                    ),
                    Text(
                      see_it_before_you_eat_it,
                      style: GoogleFonts.alice(fontSize: 25.5, color: white, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, height: 0.85),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
