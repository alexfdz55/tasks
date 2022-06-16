// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String dateToString(DateTime date) {
  return DateFormat('dd/MM/y').format(date);
}

String dateToHourString(BuildContext context, DateTime date) {
  return TimeOfDay(
    hour: date.hour,
    minute: date.minute,
  ).format(context);
}
