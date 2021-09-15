import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/size_config.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  TitleTextWidget({
    required this.text,
    this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? getProportionateScreenWidth(17),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
