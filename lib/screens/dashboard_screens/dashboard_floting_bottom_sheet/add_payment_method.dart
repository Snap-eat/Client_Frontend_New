// ignore_for_file: prefer_const_constructors, unused_field, file_names, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:country_list_pick/country_list_pick.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapeat1/component/images_constant.dart';
import 'package:snapeat1/component/text_style.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/navigator_key.dart';
import '../../../component/text_constant_key.dart';
import '../../../utils/custom_buttons.dart';
import '../../../utils/custom_list_tile_widgets.dart';
import '../../../utils/custom_text_fields.dart';

class add_payment_method extends StatefulWidget {
  const add_payment_method({super.key});

  @override
  State<add_payment_method> createState() => add_payment_methodState();
}

class add_payment_methodState extends State<add_payment_method> {
  TextEditingController cardController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  bool taponDebitcard = false;
  bool showExpiryDate = false;
  bool showbutton = false;

  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: taponDebitcard ? h * 0.6 : h * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: white),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.only(left: w * 0.05, right: w * 0.05, top: h * 0.015),
          child: Column(
            children: [
              ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  leading: GestureDetector(
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
                  title: AlegreyaText(
                      NEW_PAYMENT_METHOD, black, FontWeight.normal, 21)),
              taponDebitcard
                  ? Column(
                      children: [
                        SizedBox(
                          height: h * 0.02,
                        ),
                        searchTextformField(
                          (value) {
                            if (value.length > 15) {
                              showExpiryDate = true;
                              setState(() {});
                              FocusScope.of(context).nextFocus();
                            } else {
                              showExpiryDate = false;
                              setState(() {});
                            }
                          },
                          Image.asset(
                            debitIcon,
                            height: h * 0.025,
                          ),
                          cardController,
                          CARD_NUMBER,
                          TextAlign.start,
                          16,
                          TextInputType.number,
                          [
                            LengthLimitingTextInputFormatter(16),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        showExpiryDate
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: w * 0.43,
                                        child: searchTextformField(
                                          (value) {
                                            if (value.length == 4) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: IBMPlexsansText(EXPIRY,
                                                  black, FontWeight.bold, 14)),
                                          expController,
                                          MMYY,
                                          TextAlign.center,
                                          4,
                                          TextInputType.number,
                                          [
                                            LengthLimitingTextInputFormatter(4),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: w * 0.43,
                                        child: searchTextformField(
                                          (value) {
                                            if (value.length == 3) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: IBMPlexsansText(CVV, black,
                                                  FontWeight.bold, 14)),
                                          cvvController,
                                          T123,
                                          TextAlign.center,
                                          3,
                                          TextInputType.number,
                                          [
                                            LengthLimitingTextInputFormatter(3),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: h * 0.068,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(color: grey)),
                                          width: w * 0.43,
                                          child: CountryListPick(
                                            onChanged: (value) {},
                                            theme: CountryTheme(
                                              isShowFlag: true,
                                              isShowTitle: true,
                                              isShowCode: false,
                                              isDownIcon: true,
                                              showEnglishName: false,
                                              labelColor: Colors.black,
                                            ),
                                            initialSelection: '+62',
                                          )),
                                      SizedBox(
                                        width: w * 0.43,
                                        child: searchTextformField(
                                          (value) {
                                            if (value.length == 7) {
                                              showbutton = true;
                                              setState(() {});
                                            } else {
                                              showbutton = false;
                                              setState(() {});
                                            }
                                          },
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: IBMPlexsansText(POST_CODE,
                                                  black, FontWeight.bold, 14)),
                                          postcodeController,
                                          SE186ZF,
                                          TextAlign.center,
                                          7,
                                          TextInputType.name,
                                          [
                                            LengthLimitingTextInputFormatter(7),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : Container()
                      ],
                    )
                  : Column(
                      children: [
                        customListtile(() {
                          taponDebitcard = true;
                          setState(() {});
                        }, DEBIT_CREDIT_CARD),
                        Divider(),
                        customListtile(() {}, APPLE_PAY),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      scanCard();
                    },
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: primary1,
                      child: Icon(
                        Icons.add,
                        color: white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  IBMPlexsansText(SCAN_YOUR_CARD, primary1, FontWeight.bold, 15)
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(lockicon),
                  IBMPlexsansText(
                      YOUR_PAYMENT_INFORMATION, black30, FontWeight.normal, 12)
                ],
              ),
              showbutton
                  ? Padding(
                      padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.02),
                      child: DefaultButtonLogin(
                          width: w * 1,
                          height: h * 0.065,
                          text: SAVE,
                          press: () {
                            Navigator.pop(context);
                          },
                          colors: [primary1, primary_light]),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  // add Scan your card
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );

  Future<void> scanCard() async {
    final CardDetails? cardDetails =
        await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted || cardDetails == null) return;
    setState(() {
      _cardDetails = cardDetails;
    });
  }
}
