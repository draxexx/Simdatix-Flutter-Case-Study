import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/size_config.dart';

class ContentTextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? size;
  final String? fontFamily;
  ContentTextWidget({
    required this.text,
    this.fontWeight,
    this.color,
    this.size,
    this.fontFamily,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? getProportionateScreenWidth(13),
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? black,
        fontFamily: fontFamily ?? "Roboto",
      ),
    );
  }
}
