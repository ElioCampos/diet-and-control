import 'package:flutter/material.dart';

Color customGreen = Color.fromRGBO(0, 214, 129, 1.0);

Widget infoText(String text, bool main) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: main ? FontWeight.bold : null,
          color: main ? customGreen : null),
    );
  }