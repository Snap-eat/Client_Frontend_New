// ignore_for_file: prefer_collection_literals, avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables, sort_child_properties_last, file_names, unnecessary_string_interpolations, camel_case_types
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../component/images_constant.dart';
import '../../component/text_constant_key.dart';
import '../../component/text_style.dart';
import '../../utils/custom_tabbar_widget.dart';

class show_restaurants_list_on_mapview extends StatefulWidget {
  const show_restaurants_list_on_mapview({super.key});

  @override
  State<show_restaurants_list_on_mapview> createState() =>
      show_restaurants_list_on_mapviewState();
}

class show_restaurants_list_on_mapviewState
    extends State<show_restaurants_list_on_mapview> {
  CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  final Set<Marker> markers = Set<Marker>();
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14.0);
  final Mode mode = Mode.fullscreen;
  var mymarkers = [];
  int currentIndex = 0;
  int index = 0;
  int? indexonList;
  String title = "";
  @override
  void initState() {
    // getLocation();

    setState(() {});
    super.initState();
  }

  // getLocation() async {
  //   Position position = await determinePosition();
  //   GoogleMapController googleMapController = await _controller.future;
  //   googleMapController.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //           bearing: 30,
  //           target: LatLng(position.latitude, position.longitude),
  //           zoom: 16)));
  //   setState(() {});
  // }

  var w, h;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onTap: (position) {
                customInfoWindowController.addInfoWindow;
              },
              scrollGesturesEnabled: true,
              initialCameraPosition: initialCameraPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              zoomControlsEnabled: true,
              markers: getmarkers(),
              onMapCreated: (controller) {
                // _controller.complete(controller);
                customInfoWindowController.googleMapController = controller;
              },
              onCameraMove: (CameraPosition position) async {
                setState(() {
                  initialCameraPosition = position;
                });
              },
              onCameraIdle: () async {},
            ),
            Container(
              height: h * 0.25,
              width: w * 1,
              padding: EdgeInsets.only(
                left: w * 0.045,
                right: w * 0.045,
                top: h * 0.065,
              ),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: white, blurRadius: 15),
                  BoxShadow(color: white, blurRadius: 15)
                ],
              ),
              child: Column(children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            navigation_service.navigatorKey.currentContext!);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 22,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.75,
                      child: customTabbarWith2Tabs(
                          10,
                          () {
                            currentIndex = 1;
                            setState(() {});
                          },
                          h * 0.045,
                          w * 0.3,
                          currentIndex == 1 ? primary1 : transparent,
                          currentIndex == 1 ? white : transparent,
                          IBMPlexsansText(
                              restaurants,
                              currentIndex == 1 ? white : black80,
                              FontWeight.w500,
                              14),
                          () {
                            currentIndex = 2;

                            setState(() {});
                          },
                          h * 0.045,
                          w * 0.3,
                          currentIndex == 2 ? primary1 : transparent,
                          currentIndex == 2 ? white : transparent,
                          IBMPlexsansText(
                              home_cooked,
                              currentIndex == 2 ? white : black80,
                              FontWeight.w500,
                              14)),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                    children: [
                      FilterTapButton(() {
                        index = 0;
                        setState(() {});
                      },
                          eatIcon,
                          index == 0 ? primary1 : white,
                          index == 0 ? primary1 : grey,
                          index == 0 ? white : orange),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(currentIndex == 1 ? delivery : eatout,
                          grey90, FontWeight.bold, 12)
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: w * 0.05, right: w * 0.05),
                          child: FilterTapButton(() {
                            index = 1;
                            setState(() {});
                          },
                              bikeIcon,
                              index == 1 ? primary1 : white,
                              index == 1 ? primary1 : grey,
                              index == 1 ? white : orange)),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(currentIndex == 1 ? collection : delivery,
                          grey90, FontWeight.bold, 12)
                    ],
                  ),
                  Column(
                    children: [
                      FilterTapButton(() {
                        index = 2;
                        setState(() {});
                      },
                          bagIcon,
                          index == 2 ? primary1 : white,
                          index == 2 ? primary1 : grey,
                          index == 2 ? white : orange),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      IBMPlexsansText(
                          currentIndex == 1 ? chief_atHome : collection,
                          grey90,
                          FontWeight.bold,
                          12)
                    ],
                  ),
                ]),
              ]),
            ),
            Align(
                alignment: Alignment.center,
                child: Center(
                    child: Image.asset(
                  dropPin,
                  height: 40,
                ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: h * 0.03),
                child: SizedBox(
                  height: h * 0.15,
                  child: ListView.builder(
                      itemCount: 3,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexonList = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              left: w * 0.03,
                            ),
                            alignment: Alignment.centerLeft,
                            height: h * 0.15,
                            padding: EdgeInsets.only(
                                left: w * 0.03,
                                right: w * 0.03,
                                bottom: h * 0.01),
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(
                                  color:
                                      indexonList == index ? primary1 : orange),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage(restaurantsImage),
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.01,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IBMPlexsansText("$title", primary1,
                                        FontWeight.normal, 20),
                                    IBMPlexsansText("Japanese · £££  ", black80,
                                        FontWeight.normal, 12),
                                    Row(
                                      children: [
                                        SvgPicture.asset(arrowIcon),
                                        IBMPlexsansText("0.8m · ", black80,
                                            FontWeight.normal, 12),
                                        SvgPicture.asset(starIcon),
                                        IBMPlexsansText("4.9 (361)", black80,
                                            FontWeight.normal, 12),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: grey90,
                                          size: 18,
                                        ),
                                        IBMPlexsansText("Closes at 10pm ",
                                            orange, FontWeight.normal, 12),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      padding: EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(offerIcon))),
                                      child: Column(children: [
                                        IBMPlexsansText("Up to", white,
                                            FontWeight.normal, 8),
                                        IBMPlexsansText(
                                            "£25", white, FontWeight.bold, 15),
                                        IBMPlexsansText("credits", white,
                                            FontWeight.normal, 8),
                                      ]),
                                    ),
                                    Container(
                                      height: h * 0.035,
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(children: [
                                        SvgPicture.asset(
                                          bikeIcon,
                                          height: 13,
                                          color: white,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        IBMPlexsansText("20-35 mins", white,
                                            FontWeight.normal, 12),
                                      ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// create markers
  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(initialCameraPosition.toString()),
        position:
            LatLng(26.886618739592592, 75.75338814407587), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Happy Bar & Grill',
          snippet: 'Japanese · £££  ',
        ),
        onTap: () {},
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen), //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(initialCameraPosition.toString()),
        position:
            LatLng(26.891602626694848, 76.58219542354345), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Happy Bar & Grill2',
          snippet: 'Japanese · £££  ',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen), //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId(initialCameraPosition.toString()),
        position:
            LatLng(26.891697117180897, 75.75995184481144), //position of marker
        infoWindow: InfoWindow(
          title: 'Happy Bar & Grill3',
          snippet: 'Japanese · £££  ',
        ),

        onTap: () {
          setState(() {
            title = "Japanese · £££  ";
          });
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    });

    return markers;
  }
}
