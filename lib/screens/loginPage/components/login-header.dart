import 'package:flutter/material.dart';

Padding loginText(double fontsize, Color color, String content) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      content,
      style: TextStyle(fontSize: fontsize, color: color),
      textAlign: TextAlign.center,
    ),
  );
}
