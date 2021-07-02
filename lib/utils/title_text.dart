import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';

Column TitleText(String text) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
              color: getCorTema(),
            )
        ),
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      ),
      Divider(
        height: 8,
        thickness: 2,
        indent: 16,
        endIndent: 104,
        color: Color(0xFFB8CC3B),
      )
    ],
  );
}

Container DescriptionText(String text) {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        )
    ),
    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
  );
}