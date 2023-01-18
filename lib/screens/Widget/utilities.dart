import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:organiza_mi/customs/custom_color.dart';

import '/customs/custom_color.dart';

Future<TimeOfDay?> timePicker(BuildContext context) {
  return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorTheme,
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
      cancelText: 'CANCELAR',
      confirmText: 'OK');
}

Future<DateTime?> datePicker(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2018),
    lastDate: DateTime(3000),
  );
}

formatTimerOrDate({required String type}) {
  DateTime nowDate = DateTime.now();

  DateTime now = DateTime(
      nowDate.year,
      nowDate.month,
      nowDate.day,
      nowDate.hour - 3,
      nowDate.minute,
      nowDate.second,
      nowDate.microsecond,
      nowDate.microsecond);

  if (type == 'T') {
    String formattedTime = DateFormat('HH:mm', 'pt_BR').format(now);
    return formattedTime;
  } else {
    String formattedTime = DateFormat('dd/MM/yyyy', 'pt_BR').format(now);
    return formattedTime;
  }
}
