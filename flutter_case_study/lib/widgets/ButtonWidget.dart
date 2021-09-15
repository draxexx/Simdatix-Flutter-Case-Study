import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/size_config.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final Function() onTap;
  ButtonWidget({
    required this.bgColor,
    required this.textColor,
    required this.text,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(150),
        height: getProportionateScreenWidth(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: getProportionateScreenWidth(13),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
