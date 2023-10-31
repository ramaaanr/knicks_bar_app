import 'package:flutter/material.dart';
import 'package:knicks_bar_app/detail_screen/mobile_screen.dart';
import 'package:knicks_bar_app/detail_screen/dekstop_screen.dart';
import 'package:knicks_bar_app/detail_screen/tab_screen.dart';
import 'package:knicks_bar_app/model/shoes_catalogue.dart';

class DetailScreen extends StatefulWidget {
  final Shoe shoe;
  DetailScreen({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen(shoe: shoe);
}

class _DetailScreen extends State<DetailScreen> {
  final Shoe shoe;
  _DetailScreen({
    required this.shoe,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileScreen(shoe: shoe);
      } else if (constraints.maxWidth <= 1000) {
        return TabScreen(shoe: shoe);
      } else {
        return DekstopScreen(shoe: shoe);
      }
    });
  }
}
