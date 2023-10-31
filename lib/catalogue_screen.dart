import 'package:flutter/material.dart';
import 'package:knicks_bar_app/catalogue_screen/dekstop_screen.dart';
import 'package:knicks_bar_app/catalogue_screen/tab_screen.dart';
import 'package:knicks_bar_app/catalogue_screen/mobile_screen.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileScreen();
      } else if (constraints.maxWidth <= 1200) {
        return TabScreen();
      } else {
        return DekstopScreen();
      }
    });
  }
}
