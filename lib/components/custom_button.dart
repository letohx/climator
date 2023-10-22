import 'package:climator/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color borderColor;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? backgroundColor;
  final String text;
  final void Function() onPressed;
  final double kBottomMargin;

  const CustomButton({
    required this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    required this.text,
    required this.kBottomMargin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))),
        height: kBottomContainerHeight,
        width: 550,
        padding: const EdgeInsets.all(10.0),
        margin: EdgeInsets.only(
            top: 10.0, bottom: kBottomMargin, left: 10, right: 10),
        color: backgroundColor,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 14,
            ),
          ),
        ),
      ),
    );
  }
}
