// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../utils/custom_buttons.dart';
import '../../../../utils/custom_loader.dart';
import 'my_favorites_main_page.dart';

class dishes_screen extends StatefulWidget {
  const dishes_screen({super.key});

  @override
  State<dishes_screen> createState() => dishes_screenState();
}

class dishes_screenState extends State<dishes_screen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MasonryGridView.count(
        itemCount: images.length,
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: w * 0.03,
        crossAxisSpacing: w * 0.03,
        padding: EdgeInsets.only(top: h * 0.02),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showOrderDialog();
            },
            child: Container(
              height: index % 2 == 0 ? h * 0.305 : h * 0.2,
              width: w * 0.4,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: const [BoxShadow(color: grey, blurRadius: 15)],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(images[index]['image'].toString()),
                    onError: (exception, stackTrace) =>
                        Center(child: customLoader),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(favoriteIcon))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: w * 0.3,
                            child: AlgeraText2("King Prawn Curry Quarter",
                                white, FontWeight.bold, 14)),
                        AlegreyaText("Burger King", white, FontWeight.bold, 12)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// create show order dialog
showOrderDialog() {
  return showDialog(
      context: navigation_service.navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: w * 0.03, right: w * 0.03),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(spleshbackground),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20)),
                  width: w * 1,
                  height: h * 0.5,
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: grey90,
                            child: Icon(
                              Icons.clear,
                              color: black80,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: grey90,
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: black80,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: grey90,
                                child: Icon(
                                  Icons.download,
                                  color: black80,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.025, top: h * 0.05),
                  child: DefaultButtonLogin(
                      width: w * 1,
                      height: h * 0.06,
                      text: ORDER_THIS_DISHES,
                      press: () {
                        Navigator.pop(context);
                      },
                      colors: [primary_light, primary]),
                )
              ],
            ),
          ),
        );
      });
}
