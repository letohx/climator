import 'package:climator/utilities/constants.dart';
import 'package:flutter/material.dart';

class WeatherDetailsWithIcon extends StatelessWidget {
  final String iconText;
  final String detailText;
  final String labelText;

  WeatherDetailsWithIcon({
    required this.iconText,
    required this.detailText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDetailsContainerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(iconText),
          ),
          Expanded(
            child: Text(
              detailText,
              style: kSmallNumber,
            ),
          ),
          Expanded(
            child: Text(
              labelText,
              style: kSmallTextLabelTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
