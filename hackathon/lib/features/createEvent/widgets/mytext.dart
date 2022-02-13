// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

MyText(
  String text,
  double size,
  Color color,
) {
  return Text(text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ));
}
