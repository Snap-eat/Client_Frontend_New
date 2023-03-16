// ignore_for_file: prefer_const_constructors, annotate_overrides, sized_box_for_whitespace, unused_local_variable, unused_field, unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../component/navigator_key.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});
  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  static const List<String> page1 = [IMAGE103, IMAGE186];
  int _counter = 0;
  bool _clear = true;
  bool _error = false;
  initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_clear || _error) {
          _clear = _error = false;
        } else {
          _counter = 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String? url;
    if (!_clear) {
      url = page1[_counter];
    }

    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            left: w * 0.08,
            right: w * 0.08,
            top: h * 0.04,
            child: ImageFade(
              image: url == null ? null : AssetImage(url),
              duration: const Duration(milliseconds: 700),
              syncDuration: const Duration(milliseconds: 1000),
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.fill,
              scale: 2,
            )),
      ],
    ));
  }
}

class Intro2 extends StatefulWidget {
  const Intro2({super.key});
  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  int _counter = 0;

  static const List<String> page2 = [IMAGE1054, IMAGE1052, IMAGE105, IMAGE1054];

  initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_counter < page2.length - 1) {
          _counter++;
        }
        // _counter = (_counter + 1) % page2.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String? url;
    url = page2[_counter];
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            left: w * 0.08,
            right: w * 0.08,
            top: h * 0.06,
            child: ImageFade(
              image: url == null ? null : AssetImage(url),
              duration: const Duration(milliseconds: 1000),
              syncDuration: const Duration(milliseconds: 1200),
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
              fit: BoxFit.fill,
              scale: 2,
            )),
      ],
    ));
  }
}

bool showImage = false;

class Intro3 extends StatefulWidget {
  const Intro3({super.key});
  @override
  State<Intro3> createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        milliseconds: 600,
      ),
      vsync: this,
    );
    Future.delayed(Duration(milliseconds: 400), () {
      animation = Tween<Offset>(
        begin: Offset(0.0, 0.0),
        end: Offset(0.0, 1.0),
      ).animate(animationController);
      animationController.forward();
    });
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: h * 0.08,
            left: w * 0.08,
            right: w * 0.08,
          ),
          child: Image.asset(
            HOME_COOCKED_IMAGE,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 1.0))
            .animate(animationController),
        child: Container(
          width: w * 1,
          height: h * 1,
          margin: EdgeInsets.only(
            top: h * 0.06,
            left: w * 0.08,
            right: w * 0.08,
          ),
          child: Image.asset(
            INTRO_CHIEF,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ]));
  }
}

class Intro4 extends StatefulWidget {
  const Intro4({super.key});
  @override
  State<Intro4> createState() => _Intro4State();
}

class _Intro4State extends State<Intro4> {
  double opacityLevel = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 900), () => _changeOpacity());
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 1.0 ? 0.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Center(
        child: Container(
          height: h * 1,
          width: w * 1,
          margin: EdgeInsets.only(
            left: w * 0.08,
            right: w * 0.08,
            top: h * 0.06,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(IMAGE_106))),
        ),
      ),
      AnimatedOpacity(
        opacity: opacityLevel,
        duration: const Duration(milliseconds: 1200),
        child: Container(
          height: h * 1,
          width: w * 1,
          color: black.withOpacity(0.55),
        ),
      ),
      Container(
        width: w * 1,
        height: h * 0.75,
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(milliseconds: 1200),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
            child: Image.asset(FRAME_900),
          ),
        ),
      ),
    ]));
  }
}

class Intro5 extends StatefulWidget {
  const Intro5({super.key});
  @override
  State<Intro5> createState() => _Intro5State();
}

class _Intro5State extends State<Intro5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: h * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(IMAGE3710084),
            fit: BoxFit.cover,
          )),
        ),
      ],
    ));
  }
}

class Intro6 extends StatefulWidget {
  const Intro6({super.key});
  @override
  State<Intro6> createState() => _Intro6State();
}

class _Intro6State extends State<Intro6> {
  List lst = [
    "25 June",
    "26 June",
    "27 June",
    "28 June",
    "29 June",
  ];

  List dicountlst = [
    {"title": "10am-11am", "%": "50%", "subtitle": "selected dishes"},
    {"title": "11am-12pm", "%": "30%", "subtitle": "All food"},
    {"title": "12pm-4pm", "%": "2 for 1", "subtitle": "All food"},
    {"title": "12pm-4pm", "%": "2 for 1", "subtitle": "All food"},
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(
            left: w * 0.08,
            right: w * 0.08,
            top: h * 0.06,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(IMAGE_106)),
              borderRadius: BorderRadius.circular(30)),
        ),
        Container(
          width: w * 1,
          height: h * 0.75,
          color: black.withOpacity(0.6),
          child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(),
                  Container(
                    width: w * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        color: white),
                    child: Padding(
                      padding: EdgeInsets.only(top: h * 0.005, left: w * 0.05),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AlegreyaText(DISCOUNTS, black, FontWeight.w700, 21),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: List.generate(
                                lst.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    selectIndex = index;
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: selectIndex == index
                                              ? primary
                                              : transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: IBMPlexsansText(
                                            lst[index],
                                            selectIndex == index
                                                ? white
                                                : black,
                                            FontWeight.w500,
                                            14),
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3),
                                          height: 25,
                                          width: 1,
                                          color: grey)
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                  children: List.generate(
                                      dicountlst.length,
                                      (index) => Card(
                                            // color: primary,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: h * 0.06,
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: orange),
                                                    child: IBMPlexsansText(
                                                        dicountlst[index]
                                                            ['title'],
                                                        white,
                                                        FontWeight.w500,
                                                        14),
                                                  ),
                                                  SizedBox(
                                                    height: h * 0.01,
                                                  ),
                                                  IBMPlexsansText(
                                                      dicountlst[index]['%'],
                                                      orange,
                                                      FontWeight.w700,
                                                      25),
                                                  IBMPlexsansText(
                                                      dicountlst[index]
                                                          ['subtitle'],
                                                      grey90,
                                                      FontWeight.w500,
                                                      12),
                                                  SizedBox(
                                                    height: h * 0.01,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))),
                            )
                          ]),
                    ),
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}

class Intro7 extends StatefulWidget {
  const Intro7({super.key});
  @override
  State<Intro7> createState() => _Intro7State();
}

class _Intro7State extends State<Intro7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            height: h * 1,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(HONOUR_HOLDING_IMAGE))),
          ),
        ],
      ),
    );
  }
}

class Intro8 extends StatefulWidget {
  const Intro8({super.key});
  @override
  State<Intro8> createState() => _Intro8State();
}

class _Intro8State extends State<Intro8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.only(left: w * 0.11, right: w * 0.11, top: h * 0.06),
        height: h * 1,
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(IMAGE_101))),
      ),
    );
  }
}

class Intro9 extends StatefulWidget {
  const Intro9({super.key});
  @override
  State<Intro9> createState() => _Intro9State();
}

class _Intro9State extends State<Intro9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: h * 1,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          IMAGE_99,
        ),
        fit: BoxFit.fill,
      )),
    ));
  }
}

class Intro10 extends StatefulWidget {
  const Intro10({super.key});
  @override
  State<Intro10> createState() => _Intro10State();
}

class _Intro10State extends State<Intro10> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
