import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateConvert on String {

  String toSplitDate() {
    final old_format =  DateFormat('yyyy-MM-dd');
    final newDate =  DateFormat('dd MMM');
    DateTime dateTime=old_format.parse(this);
    String date=newDate.format(dateTime);
    return date.replaceAll(" ", "\n");
  }
}