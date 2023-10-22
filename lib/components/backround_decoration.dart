import 'package:flutter/material.dart';

const kBackgroundDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('images/blur_background.jpg'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Color(0xCCFFFFFF), BlendMode.dstATop),
  ),
);
