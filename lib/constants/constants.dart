import 'package:flutter/material.dart';

Color primaryTextColor = Color(0xFF414C6B);
Color secondaryTextColor = Color(0xFFE4979E);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color postNonFocusTextColor = Color(0xFFE0DDCF);
Color postFocusTextColor = Color(0xFF414C6B);
Color navigationColor = Color(0xFFE0DDCF);

Widget titleText(text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Avenir',
      fontSize: 40,
      color: primaryTextColor,
      fontWeight: FontWeight.w900,
    ),
    textAlign: TextAlign.left,
  );
}
