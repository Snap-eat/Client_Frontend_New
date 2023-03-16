// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, file_names, camel_case_types
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/component/text_style.dart';
import '../../../component/images_constant.dart';
import '../../../component/navigation_routes.dart';
import '../../../component/navigator_key.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_buttons.dart';
import '../../../utils/custom_loader.dart';
import '../../../utils/indicator_widgets.dart';
import '../../location_time/location_time.dart';
import '../../location_time/show_restaurants_list_on_mapview.dart';

class restaurants_home_screen extends StatefulWidget {
  const restaurants_home_screen({super.key});

  @override
  State<restaurants_home_screen> createState() =>
      restaurants_home_screenState();
}

class restaurants_home_screenState extends State<restaurants_home_screen> {
  CarouselController buttonCarouselController = CarouselController();

  List images = [
    {"image": "assets/images/image1.jpeg"},
    {"image": "assets/images/image2.jpeg"},
    {"image": "assets/images/image4.jpeg"},
    {"image": "assets/images/image3.jpeg"},
    {"image": "assets/images/image4.jpeg"}
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: GestureDetector(
            onTap: () {
              pushTo(location_time());
            },
            child: Row(
              children: [
                Image.asset(
                  LOCATION_PIN,
                  color: black80,
                  height: 25,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 03,
                    ),
                    child: AlegreyaText(
                        CURRENT_LOCATION_ASP, black, FontWeight.w500, 21)),
                const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: h * 0.015,
        ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.001),
          child: CarouselSlider(
            disableGesture: true,
            options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                viewportFraction: 0.87,
                padEnds: false,
                height: h * 0.21,
                onPageChanged: ((index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      margin: EdgeInsets.only(left: w * 0.03),
                      alignment: Alignment.bottomCenter,
                      height: h * 0.15,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                              i["image"].toString(),
                            ),
                            onError: (exception, stackTrace) =>
                                Center(child: customLoader),
                            fit: BoxFit.cover,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AlegreyaText("Happy Bar & Grill", white,
                                        FontWeight.w500, 21),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          bikeIcon,
                                          color: white,
                                          height: 12,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        IBMPlexsansText("20-35 mins", white,
                                            FontWeight.normal, 10),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          bagIcon,
                                          color: white,
                                          height: 13,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        IBMPlexsansText("20 mins", white,
                                            FontWeight.normal, 10)
                                      ],
                                    ),
                                  ],
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: MaterialButton(
                                      height: 35,
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: orange,
                                      child: IBMPlexsansText(ORDER_AGAIN, white,
                                          FontWeight.w500, 15)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),

        // call  indicator container
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                images.length,
                (index) => Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: indicatorConatainer(
                        currentIndex == index ? grey90 : grey)))),
        SizedBox(
          height: h * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Row(
            children: [
              AlegreyaText(BROUSE, black, FontWeight.w700, 21),
              SizedBox(
                width: w * 0.01,
              ),
              AlegreyaText(BY_CUSINE, black, FontWeight.normal, 21),
            ],
          ),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        SizedBox(
          height: h * 0.195,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Material(
                        shadowColor: black,
                        elevation: 15,
                        borderRadius: BorderRadius.circular(
                          h * 0.065,
                        ),
                        child: CircleAvatar(
                          onBackgroundImageError: (exception, stackTrace) =>
                              Center(child: customLoader),
                          radius: h * 0.065,
                          backgroundImage:
                              AssetImage(images[index]['image'].toString()),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.005,
                      ),
                      IBMPlexsansText("Restaurants", black, FontWeight.bold, 14)
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: h * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Align(
              alignment: Alignment.centerLeft,
              child: AlegreyaText(
                  POPULAR_RESTAURANTS, black, FontWeight.w700, 21)),
        ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.03),
          child: SizedBox(
            height: h * 0.45,
            child: ListView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(right: w * 0.045, top: h * 0.01),
                          height: h * 0.34,
                          width: w * 0.72,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: grey, blurRadius: 15)
                              ],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  images[index]['image'].toString(),
                                ),
                                onError: (exception, stackTrace) =>
                                    Center(child: customLoader),
                              )),
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                  padding: EdgeInsets.only(top: 10, right: 15),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(favoriteIcon1)))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AlegreyaText(
                            "Happy Bar & Grill", black90, FontWeight.w500, 21),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IBMPlexsansText("British · £££ ·", black80,
                                FontWeight.normal, 12),
                            IBMPlexsansText(
                                " 0.8m away ·", black80, FontWeight.normal, 12),
                            IBMPlexsansText(
                                "Free delivery", primary1, FontWeight.w500, 12),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              starIcon,
                              height: 16,
                            ),
                            SizedBox(width: 3),
                            IBMPlexsansText(
                                "4.9", black80, FontWeight.normal, 12),
                            IBMPlexsansText(" (361 reviews)·", grey90,
                                FontWeight.normal, 12),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Icon(
                                Icons.access_time_rounded,
                                color: grey90,
                                size: 17,
                              ),
                            ),
                            IBMPlexsansText("Closes in 30 mins", orange,
                                FontWeight.w500, 12),
                          ],
                        ),
                      ]);
                }),
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlegreyaText(RECOMMENDED_DISHES, black, FontWeight.w700, 21),
              Row(
                children: [
                  IBMPlexsansText(VIEW_ALL, orange, FontWeight.w700, 15),
                  SvgPicture.asset(
                    icon3d,
                    height: 28,
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.03),
          child: SizedBox(
            height: h * 0.3,
            child: ListView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(right: w * 0.045, top: h * 0.01),
                          height: h * 0.18,
                          width: w * 0.4,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(color: grey, blurRadius: 15)
                              ],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  images[index]['image'].toString(),
                                ),
                                onError: (exception, stackTrace) =>
                                    Center(child: customLoader),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: transparent,
                                  backgroundImage: AssetImage(offerIcon),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "£123",
                                          style: GoogleFonts.lusitana(
                                              fontSize: 16, color: white),
                                        ),
                                        Text("credits",
                                            style: GoogleFonts.lusitana(
                                              fontSize: 10,
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ]),
                                ),
                                Container(
                                    height: 30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: SvgPicture.asset(icon3d)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AlegreyaText(
                            "Avocado salad", black90, FontWeight.w500, 21),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IBMPlexsansText("Afrokoko · £7.5 ", black80,
                                FontWeight.normal, 12),
                            SvgPicture.asset(
                              bikeIcon,
                              color: grey90,
                              height: 13,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              starIcon,
                              height: 16,
                            ),
                            SizedBox(width: 3),
                            IBMPlexsansText(
                                "4.9", black80, FontWeight.normal, 12),
                            IBMPlexsansText(" (361 reviews)·", grey90,
                                FontWeight.normal, 12),
                          ],
                        ),
                      ]);
                }),
          ),
        ),
        SizedBox(
          height: h * 0.020,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlegreyaText(RESTAURANTS_LIST, black, FontWeight.w700, 21),
              Align(
                  alignment: Alignment.bottomRight,
                  child: customButtonViewMap(() {
                    pushTo(show_restaurants_list_on_mapview());
                  }, orange, white, mapviewIcon1, MAP_VIEW, white)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: ListView.builder(
              itemCount: images.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: h * 0.020),
                  child: Stack(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: h * 0.27,
                              width: w * 1,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(color: grey, blurRadius: 15)
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      images[index]['image'].toString(),
                                    ),
                                    onError: (exception, stackTrace) =>
                                        Center(child: customLoader),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 37,
                                      backgroundColor: transparent,
                                      backgroundImage: AssetImage(offerIcon),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("up to ",
                                                style: GoogleFonts.lusitana(
                                                  fontSize: 12,
                                                  color: white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text(
                                              "£123",
                                              style: GoogleFonts.lusitana(
                                                  fontSize: 20, color: white),
                                            ),
                                            Text("credits",
                                                style: GoogleFonts.lusitana(
                                                  fontSize: 12,
                                                  color: white,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]),
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, right: 15),
                                        child: Image.asset(favoriteIcon)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AlegreyaText("Happy Bar & Grill", black90,
                                FontWeight.w500, 21),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IBMPlexsansText("British · £££ ·", black80,
                                    FontWeight.normal, 12),
                                IBMPlexsansText(" 0.8m away ·", black80,
                                    FontWeight.normal, 12),
                                IBMPlexsansText("Free delivery", primary1,
                                    FontWeight.w500, 12),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  starIcon,
                                  height: 16,
                                ),
                                SizedBox(width: 3),
                                IBMPlexsansText(
                                    "4.9", black80, FontWeight.normal, 12),
                                IBMPlexsansText(" (361 reviews)·", grey90,
                                    FontWeight.normal, 12),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Icon(
                                    Icons.access_time_rounded,
                                    color: grey90,
                                    size: 17,
                                  ),
                                ),
                                IBMPlexsansText("Closes in 30 mins", orange,
                                    FontWeight.w500, 12),
                              ],
                            ),
                          ]),
                      Padding(
                        padding:
                            EdgeInsets.only(top: h * 0.24, right: w * 0.05),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: customButtonViewMap(() {}, primary1, white,
                                bagIcon, "20 min", white)),
                      ),
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(left: w * 0.001),
          child: CarouselSlider(
            disableGesture: true,
            options: CarouselOptions(
                animateToClosest: true,
                aspectRatio: 16 / 15,
                viewportFraction: 0.87,
                enableInfiniteScroll: true,
                autoPlay: true,
                pageSnapping: true,
                padEnds: false,
                height: h * 0.21,
                onPageChanged: ((index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      margin: EdgeInsets.only(left: w * 0.03),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: w * 0.1, top: h * 0.04),
                      height: h * 0.2,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage(
                              i["image"].toString(),
                            ),
                          )),
                      child: IBMPlexsansText("10% OFF \non all orders", white,
                          FontWeight.w600, 17));
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: h * 0.010,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              images.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Center(
                      child: indicatorConatainer(
                          currentIndex == index ? grey90 : grey)))),
        ),
        SizedBox(
          height: h * 0.02,
        )
      ],
    );
  }
}
