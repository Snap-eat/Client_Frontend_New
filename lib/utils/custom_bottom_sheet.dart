// custom bottom seet
import 'package:flutter/material.dart';
import '../component/navigator_key.dart';
import 'colors.dart';

showCustomBottomSeet(Widget widget) {
  return showModalBottomSheet(
      elevation: 0,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: navigation_service.navigatorKey.currentContext!,
      barrierColor: black.withOpacity(0.5),
      builder: (builder) => widget);
}
