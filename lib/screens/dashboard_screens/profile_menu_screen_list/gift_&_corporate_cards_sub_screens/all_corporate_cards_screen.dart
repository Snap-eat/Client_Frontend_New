// ignore_for_file: prefer_const_constructors, camel_case_types, unnecessary_string_interpolations
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/utils/custom_bottom_sheet.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_constant_key.dart';
import '../../../../component/text_style.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/container_widgets.dart';
import '../../../../utils/custom_text_fields.dart';
import '../../../../utils/dialog_box_widgets.dart';
import '../../../../utils/indicator_widgets.dart';
import '../my__favorites_screen_list/my_favorites_main_page.dart';
import 'change_date_bottom_sheet.dart';
import 'eligible_times_dialog.dart';

var changedate = '1st-Feb-22 (Today)';
var changedate2 = '1st-Feb-22 (Today)';

class all_corporate_cards_screen extends StatefulWidget {
  const all_corporate_cards_screen({super.key});

  @override
  State<all_corporate_cards_screen> createState() =>
      all_corporate_cards_screenState();
}

class all_corporate_cards_screenState
    extends State<all_corporate_cards_screen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var messageController = TextEditingController();

  int currentpic = 0;
  int tapOfList = 0;
  int tapOfquantity = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: w * 0.001,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 0.87,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  padEnds: false,
                  height: h * 0.21,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      currentpic = index;
                    });
                  })),
              items: images.map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    width: w * 1,
                    margin: EdgeInsets.only(left: w * 0.045),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: h * 0.008),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: grey),
                        image: DecorationImage(
                            image: AssetImage(i['image'].toString()),
                            fit: BoxFit.cover)),
                  );
                });
              }).toList(),
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                images.length,
                (index) => Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: indicatorConatainer(
                        currentpic == index ? grey90 : grey))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.045),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.01),
                  child: Divider(),
                ),

                AlegreyaText(GIFT_VALUE, black80, FontWeight.normal, 22),
                SizedBox(
                  height: h * 0.01,
                ),
                SizedBox(
                    height: h * 0.04,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              tapOfList = index;
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: w * 0.01),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.045, vertical: h * 0.008),
                              decoration: BoxDecoration(
                                  color: tapOfList == index
                                      ? primary1
                                      : transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: grey)),
                              child: IBMPlexsansText(
                                  "£${index + 1}",
                                  tapOfList == index ? white : black,
                                  FontWeight.bold,
                                  14),
                            ),
                          );
                        })),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.015, bottom: h * 0.01),
                  child: Divider(),
                ),
                AlegreyaText(QUANTITY, black80, FontWeight.normal, 22),
                SizedBox(
                    height: h * 0.07,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              tapOfquantity = index;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: tapOfquantity == index
                                        ? primary1
                                        : white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.blueGrey.withOpacity(0.3),
                                          blurRadius: 2),
                                    ]),
                                child: IBMPlexsansText(
                                    "£${index + 1}",
                                    tapOfquantity == index ? white : black,
                                    FontWeight.bold,
                                    16),
                              ),
                            ),
                          );
                        })),
                Divider(),
                IBMPlexsansText(RECIPIENTS, black, FontWeight.normal, 22),
                SizedBox(
                  height: h * 0.01,
                ),

                // call to search text form field
                searchTextField(
                    Padding(
                        padding:
                            EdgeInsets.only(left: w * 0.03, right: w * 0.03),
                        child: IBMPlexsansText(
                            NAMES, black80, FontWeight.bold, 14)),
                    JOHN_PETER,
                    GoogleFonts.alegreyaSans(fontSize: 17, color: grey90),
                    GoogleFonts.alegreyaSans(fontSize: 17, color: greyblack),
                    () {},
                    Text(""),
                    nameController),
                SizedBox(
                  height: h * 0.01,
                ),
                searchTextField(
                    Padding(
                        padding:
                            EdgeInsets.only(left: w * 0.03, right: w * 0.03),
                        child: IBMPlexsansText(
                            EMAILS, black80, FontWeight.bold, 14)),
                    JOHN_PETER_EMAILS,
                    GoogleFonts.alegreyaSans(fontSize: 17, color: grey90),
                    GoogleFonts.alegreyaSans(fontSize: 17, color: greyblack),
                    () {},
                    Text(""),
                    nameController),

                // call to message text form field
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  child: messageTextformFiled(
                    MESSAGE_HINT_TEXT,
                    messageController,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.01),
                    child: customContainer([
                      AlegreyaText(DATE_TO_SEND, black80, FontWeight.w600, 17)
                    ], "$changedate", () {
                      showCustomBottomSeet(change_date_bottom_sheet());
                    })),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.01),
                    child: customContainer([
                      AlegreyaText(EXPIRY_DATE, black80, FontWeight.w600, 17)
                    ], "1st-Feb-22 (Today)", () {})),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.01),
                    child: customContainer([
                      AlegreyaText(
                          ELIGIBLE_TIMES, black80, FontWeight.w600, 17),
                      SvgPicture.asset(thinkIcon)
                    ], "Mon-Fri 8PM -10PM", () {
                      flash_dialog(demo(), w * 0.6);
                    })),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.01),
                    child: customContainer([
                      AlegreyaText(DATE_TO_SEND, black80, FontWeight.w600, 17),
                    ], "1st-Feb-22 (Today)", () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
