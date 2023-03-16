// ignore_for_file: file_names, prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';
import '../../../component/text_constant_key.dart';
import '../../../component/text_style.dart';

class sort_by extends StatefulWidget {
  const sort_by({super.key});

  @override
  State<sort_by> createState() => sort_byState();
}

class sort_byState extends State<sort_by> {
  List sortby = [PickedForYou, distance, hygiene, time, price, toprated];
  bool check = false;
  int currentInddex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sortby.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            currentInddex = index;
                            setState(() {});
                          },
                          child: IBMPlexsansText(
                              sortby[index].toString(),
                              currentInddex == index ? primary1 : black80,
                              FontWeight.w500,
                              15),
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            currentInddex == index ? primary : transparent,
                        child: Icon(
                          Icons.check,
                          color: currentInddex == index ? white : transparent,
                          size: 13,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: index == sortby.length - 1 ? transparent : grey,
                    thickness: 1.5,
                  ),
                ]);
          }),
    ]);
  }
}
