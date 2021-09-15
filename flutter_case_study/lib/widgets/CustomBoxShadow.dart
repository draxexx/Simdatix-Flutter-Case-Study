import 'package:flutter/material.dart';

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = Colors.black26,
    Offset offset = const Offset(0, -2),
    double blurRadius = 8,
    this.blurStyle = BlurStyle.outer,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
