import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/size_config.dart';
import 'package:flutter_case_study/widgets/ContentTextWidget.dart';

class RoundedImageWidget extends StatelessWidget {
  final String url;
  RoundedImageWidget({required this.url});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.screenHeight! * 0.25,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: ContentTextWidget(
            text: "Explore our Destinations ",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            size: getProportionateScreenWidth(14),
          ),
        ),
      ],
    );
  }
}
