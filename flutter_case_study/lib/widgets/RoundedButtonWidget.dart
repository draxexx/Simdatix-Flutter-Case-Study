import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Color? bgColor;
  RoundedButtonWidget({
    this.bgColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? lightRed,
      ),
    );
  }
}
