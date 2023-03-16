// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/component/text_constant_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../../component/images_constant.dart';
import '../../../../component/navigator_key.dart';
import '../../../../component/text_style.dart';
import '../../../../utils/app_bar_widgets.dart';
import '../../../../utils/custom_bottom_sheet.dart';
import '../../dashboard_floting_bottom_sheet/add_payment_method.dart';

class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => walletState();
}

class walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: customAppBar(""),
      body: Padding(
        padding: EdgeInsets.only(
          left: w * 0.045,
          right: w * 0.045,
        ),
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AlegreyaText(WALLET, black, FontWeight.w500, 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCustomBottomSeet(add_payment_method());
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
                      IBMPlexsansText(
                          ADD_PAYMENT_METHOD, black30, FontWeight.w500, 15)
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Image.asset(
                creditcardgreenImage,
                fit: BoxFit.cover,
                width: w * 0.83,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Image.asset(
                creditcardgtredImage,
                fit: BoxFit.cover,
                width: w * 0.83,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Image.asset(
                applePayImage,
                fit: BoxFit.cover,
                width: w * 0.83,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(lockicon),
                  IBMPlexsansText(YOUR_PAYMENT_INFORMATION_IS_STORED, black30,
                      FontWeight.normal, 14)
                ],
              )
            ]),
          );
        }),
      ),
    );
  }
}
