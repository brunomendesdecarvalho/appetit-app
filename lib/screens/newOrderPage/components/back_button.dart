import 'package:flutter/material.dart';

AppBar backButton(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
          Icons.arrow_back,
          color: Color(0xFFFF8822)
      ),
      onPressed: () => {
        Navigator.of(context).pop()
      },
    ),
  );
}