// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:snapeat1/component/navigator_key.dart';

pushTo(Widget name) async {
  return await Navigator.push(
    navigation_service.navigatorKey.currentContext!,
    MaterialPageRoute(builder: (context) => name),
  );
}

void replaceRoute(Widget name) {
  Navigator.pushReplacement(navigation_service.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => name));
}

pushName(BuildContext context, String route) {
  return Navigator.pushNamed(context, route);
}

pustAndRemoveUntil(Widget name) {
  Navigator.of(navigation_service.navigatorKey.currentContext!)
      .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => name),
          (Route<dynamic> route) => false);
}

// ignore: non_constant_identifier_names

// navigate(BuildContext context, Widget name) {
//   return Navigator.push(
//     context,
//     PageRouteBuilder(
//       pageBuilder: (_, __, ___) => name,
//       transitionDuration: Duration(milliseconds: 500),
//       transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
//     ),
//   );
// }
