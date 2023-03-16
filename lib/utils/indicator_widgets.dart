import 'package:flutter/material.dart';
import 'package:snapeat1/utils/colors.dart';

// indicater Container
indicatorConatainer(Color? color) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    height: 10,
    width: 10,
    decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: white, blurRadius: 5)],
        borderRadius: BorderRadius.circular(10),
        color: color),
  );
}
