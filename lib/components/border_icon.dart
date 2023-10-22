import 'package:flutter/material.dart';

class BorderWithIcon extends StatelessWidget {
  BorderWithIcon({
    required this.widget,
    required this.colour,
  });

  final Widget widget;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(80),
        border: Border.all(width: 2, color: colour),
      ),
      child: widget,
    );
  }
}
