import 'package:flutter/material.dart';

class MyTheme {
  static const appPrimary = Color(0xff39A552);
  static final appTheme = ThemeData(
      primaryColor: appPrimary,
      appBarTheme: const AppBarTheme(
          color: appPrimary,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(fontSize: 22)),
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
        //24
        headline5: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(fontSize: 22, color: Colors.white),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18),
                  topLeft: Radius.circular(18)))));
}
