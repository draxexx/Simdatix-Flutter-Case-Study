import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';

import 'CustomBoxShadow.dart';

class GradientCardWidget extends StatelessWidget {
  final Widget child;
  GradientCardWidget({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          CustomBoxShadow(),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gradientTop,
            gradientBottom,
          ],
        ),
      ),
      child: child,
    );
  }
}
