import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';

Container welcomeText() {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
        'Olá, Alessandra!',
        style: TextStyle(
          fontSize: 32.0,
          color: getCorTema(),
        )
    ),
    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
  );
}
Divider bottomLine() {
  return Divider(
    height: 8,
    thickness: 2,
    indent: 16,
    endIndent: 104,
    color: Color(0xFFB8CC3B),
  );
}
