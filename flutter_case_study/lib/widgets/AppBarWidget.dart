import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';

import 'TitleTextWidget.dart';

AppBar appBarWidget(String text) {
  return AppBar(
    backgroundColor: lightRed,
    leading: Icon(
      Icons.directions_bus,
    ),
    centerTitle: true,
    title: TitleTextWidget(
      text: text,
    ),
  );
}
