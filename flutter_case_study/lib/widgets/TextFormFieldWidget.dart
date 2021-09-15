import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/size_config.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Function(String?)? onSaved;
  final bool? obsecureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String hintText;
  final Color? errorBorderColor;
  TextFormFieldWidget({
    required this.onSaved,
    required this.hintText,
    this.obsecureText,
    this.textInputAction,
    this.textInputType,
    this.onFieldSubmitted,
    this.validator,
    this.focusNode,
    this.errorBorderColor,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.done,
      onFieldSubmitted: (_) => onFieldSubmitted ?? null,
      focusNode: focusNode ?? null,
      onSaved: onSaved,
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obsecureText ?? false,
      validator: validator,
      style: TextStyle(
        color: black4,
        fontSize: getProportionateScreenWidth(13),
      ),
      decoration: InputDecoration(
        hintText: hintText,
        errorStyle: TextStyle(height: 0),
        hintStyle: TextStyle(
          color: grey,
          fontSize: getProportionateScreenWidth(13),
        ),
        labelStyle: TextStyle(
          color: grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: errorBorderColor ?? grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: errorBorderColor ?? grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: errorBorderColor ?? lightRed,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: errorBorderColor ?? grey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: errorBorderColor ?? grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: errorBorderColor ?? grey,
          ),
        ),
      ),
    );
  }
}
