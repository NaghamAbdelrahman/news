import 'package:flutter/material.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/ui/settings/settings_screen.dart';

import 'my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SettingScreen.routeName: (_) => SettingScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
