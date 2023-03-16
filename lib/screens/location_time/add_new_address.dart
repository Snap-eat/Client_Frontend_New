// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_final_fields, prefer_collection_literals, prefer_interpolation_to_compose_strings, avoid_print, unused_local_variable, file_names, unnecessary_string_interpolations, import_of_legacy_library_into_null_safe, unnecessary_import, prefer_const_literals_to_create_immutables, camel_case_types
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapeat1/component/navigation_routes.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:snapeat1/utils/custom_buttons.dart';
import 'package:snapeat1/utils/custom_text_fields.dart';
import '../../component/images_constant.dart';
import '../../component/text_constant_key.dart';
import '../../services/google_map_services/google_map_permissions.dart';
import '../../utils/app_bar_widgets.dart';
import '../dashboard_screens/profile_menu_screen_list/profile_sub_screens_list/saved_address.dart';

List<AddressModel> saveAddress = [];

class add_new_address extends StatefulWidget {
  const add_new_address({super.key});

  @override
  State<add_new_address> createState() => add_new_addressState();
}

class add_new_addressState extends State<add_new_address> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(0.0, 0.0), zoom: 14.0);
  final Mode mode = Mode.fullscreen;
  TextEditingController buldingNameCon = TextEditingController();
  TextEditingController streetAddressCon = TextEditingController();
  TextEditingController postCodeCon = TextEditingController();
  TextEditingController countryCodeCon = TextEditingController();
  String buildingnameloc = "";
  String streetAddressloc = "";
  String postcodeloc = "";

  @override
  void initState() {
    getLocation();
    setState(() {});
    super.initState();
  }

  getLocation() async {
    Position position = await determinePosition();
    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 30,
            target: LatLng(position.latitude, position.longitude),
            zoom: 15)));
  }

  var w, h;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(addNewAddress),
        body: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: h * 0.45,
                child: GoogleMap(
                  scrollGesturesEnabled: true,
                  initialCameraPosition: initialCameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  markers: _markers,
                  onMapCreated: (controller) {
                    _controller.complete(controller);
                  },
                  onCameraMove: (CameraPosition cameraPositiona) {
                    initialCameraPosition = cameraPositiona;

                    setState(() {});
                  },
                  onCameraIdle: () async {},
                ),
              )),
          Container(
              height: h * 0.55,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(color: white, blurRadius: 15),
                BoxShadow(color: white, blurRadius: 15)
              ]),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: w * 0.045,
                    right: w * 0.045,
                    top: h * 0.02,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // call to default text form field
                        DefaultTextFormField(
                            buldingNameCon, (value) {}, building_name, () {
                          buldingNameCon.clear();
                        }),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        // call to default text form field
                        DefaultTextFormField(
                            streetAddressCon, (value) {}, Streetname, () {
                          streetAddressCon.clear();
                        }),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        // call to default text form field
                        DefaultTextFormField(postCodeCon, (value) {}, PostCode,
                            () {
                          postCodeCon.clear();
                        }),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        // call to custom country code picker  text form field
                        customCuntryCodePicker(
                          countryCodeCon,
                          "79579671556",
                          "79579671556",
                          black40,
                          GestureDetector(
                            onTap: () {
                              countryCodeCon.clear();
                              setState(() {});
                            },
                            child: Icon(
                              Icons.cancel,
                              color: grey90.withOpacity(0.8),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customButtonViewMap(() {}, white, primary,
                                HomeIcon2, AT_HOME, black),
                            customButtonViewMap(
                                () {}, white, primary, bagIcon, AT_WORK, black),
                            customButtonViewMap(() {}, white, primary,
                                locationIcon, AT_OWN_TAG, black),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: w * 1,
                          height: h * 0.065,
                          margin:
                              EdgeInsets.only(top: h * 0.01, bottom: h * 0.01),
                          padding: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: grey),
                          child: IBMPlexsansText(ANY_INTRUCTIONS_IE, grey90,
                              FontWeight.normal, 12),
                        )
                      ],
                    ),
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                children: [
                  // call to custom button view map
                  customButtonViewMap(
                      () {}, orange, white, mapviewIcon1, pinOnMap, white),
                  Padding(
                      padding: EdgeInsets.only(
                        top: h * 0.1,
                      ),
                      child: Image.asset(
                        dropPin,
                        height: 40,
                      )),
                  Padding(
                    padding: EdgeInsets.all(h * 0.04),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DefaultButtonLogin(
                          width: w * 1,
                          height: h * 0.065,
                          text: Confirm,
                          press: () {
                            AddressModel addressModel = AddressModel();
                            addressModel.address1 =
                                buldingNameCon.text.toString();
                            addressModel.address2 =
                                streetAddressCon.text.toString();
                            saveAddress.add(addressModel);
                            replaceRoute(
                                saved_address()); // call to SavedAddress screen
                          },
                          colors: [primary, primary_light]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ]));
  }

//  create  function for get user current location
  getUserLocationFromDropPin() async {
    final coordinates = Coordinates(initialCameraPosition.target.latitude,
        initialCameraPosition.target.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    buldingNameCon.text = "${addresses.first.addressLine}";
    streetAddressCon.text =
        "${addresses.first.locality},${addresses.first.adminArea},";
    postCodeCon.text =
        "${addresses.first.adminArea},${addresses.first.postalCode},${addresses.first.countryName}";
    setState(() {});

    return addresses.first;
  }
}

// create addresss model
class AddressModel {
  var address1;
  var address2;
  var address3;
}
