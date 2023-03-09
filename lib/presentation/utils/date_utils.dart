import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateUtils {
  static String newsDate(DateTime dateTime, BuildContext context) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }
}
