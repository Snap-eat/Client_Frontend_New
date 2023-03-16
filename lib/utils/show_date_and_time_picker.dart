//  select date picker
import 'package:flutter/material.dart';

Future<DateTime?> cutomDatePicker(BuildContext context) async {
  final datePick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
  if (datePick != null) {
    return datePick;
  }
  return null;
}

// selected  time picker
Future showTime(BuildContext context) async {
  final TimeOfDay? result =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
  if (result != null) {
    return result;
  }
  return null;
}
