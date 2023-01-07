import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(screenSize.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Language',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenSize.height * 0.03),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      IconButton(
                          onPressed: () {
                            showLanguageBottomSheet();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return const LanguageBottomSheet();
        });
  }
}
