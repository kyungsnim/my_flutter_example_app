import 'package:flutter/material.dart';
import 'package:my_flutter_example_app/constants/constants.dart';

Widget appBarWidget(title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: titleTextColor,
      ),
    ),
    backgroundColor: primaryTextColor,
  );
}

Widget boxButtonWidget(BuildContext context, title) {
  var fontSize = MediaQuery.of(context).size.width * 0.05;
  var width = MediaQuery.of(context).size.width * 0.8;
  var height = MediaQuery.of(context).size.width * 0.1;

  return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 5,
                    offset: Offset(2.0, 2.0)
                ),
              ],
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  colors: [
                    secondaryTextColor,
                    postNonFocusTextColor
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.8])),
          child: Center(
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: primaryTextColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          width: width,
          height: height,
        ),
      ]
  );
}