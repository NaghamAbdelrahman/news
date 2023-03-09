import 'package:flutter/material.dart';
import 'package:news/presentation/home/home_screen.dart';
import 'package:news/presentation/news/news_details_screen.dart';

import 'my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetailsScreen.routeName: (_) => NewsDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
