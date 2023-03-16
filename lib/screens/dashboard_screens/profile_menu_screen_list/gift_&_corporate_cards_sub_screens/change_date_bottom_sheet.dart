// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_local_variable, unused_field, unused_import, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snapeat1/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../component/navigator_key.dart';
import 'all_corporate_cards_screen.dart';

class change_date_bottom_sheet extends StatefulWidget {
  const change_date_bottom_sheet({
    super.key,
  });

  @override
  State<change_date_bottom_sheet> createState() =>
      change_date_bottom_sheetState();
}

class change_date_bottom_sheetState extends State<change_date_bottom_sheet> {
  final startdate = DateTime.now().subtract(Duration(days: 365));
  final enddate = DateTime.now().add(Duration(days: 365));
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.5,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: TableCalendar(
              focusedDay: DateTime.now(),
              daysOfWeekHeight: h * 0.03,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle:
                    TextStyle(color: grey90, fontWeight: FontWeight.w500),
                dowTextFormatter: (date, locale) {
                  return DateFormat("E").format(date).substring(0, 1);
                },
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    changedate = DateFormat("dd-MMMM-yy").format(selectedDay);
                  });
                  Navigator.pop(context);
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              firstDay: startdate,
              calendarFormat: CalendarFormat.month,
              lastDay: enddate,
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary,
                ),
              ),
              headerStyle: HeaderStyle(
                headerPadding:
                    EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: black,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: black,
                ),
                titleTextFormatter: (date, locale) {
                  return DateFormat("MMMM").format(date);
                },
              ))),
    );
  }
}
