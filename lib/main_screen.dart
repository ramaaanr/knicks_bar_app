import 'package:flutter/material.dart';
import 'package:knicks_bar_app/home_screen/dekstop_home_screen.dart';
import 'package:knicks_bar_app/home_screen/mobile_home_screen.dart';
import 'package:knicks_bar_app/home_screen/tab_home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileHomeScreen();
      } else if (constraints.maxWidth <= 1200) {
        return TabHomeScreen();
      } else {
        return DekstopHomeScreen();
      }
    });
  }
}
