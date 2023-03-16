// ignore_for_file: non_constant_identifier_names, deprecated_member_use, avoid_init_to_null, file_names, camel_case_types

import 'package:flutter/material.dart';

class home_screen_provider extends ChangeNotifier {
  int index = 0;

  bool visible = false;
  bool visible1 = false;
  bool visible2 = false;

  isVisible() {
    visible = true;
    notifyListeners();
  }

  isVisible1() {
    visible = false;
    visible2 = false;
    visible1 = true;
    notifyListeners();
  }

  isVisible2() {
    visible = false;
    visible1 = false;
    visible2 = true;
    notifyListeners();
  }

  decreement() {
    index--;
    notifyListeners();
  }

  increment() {
    index++;
    notifyListeners();
  }
}
