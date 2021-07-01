import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

Column ProgressBarAndText() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, left: 16, bottom: 8),
            child: Text(
              'O que você está vendendo?',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16, bottom: 8),
            child: Text(
              '1 de 3',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54
              ),
            ),
          )
        ],
      ),
      Container(
        child: FAProgressBar(
          currentValue: 33,
          size: 8,
          progressColor: getCorTema(),
          backgroundColor: Colors.black12,
        ),
        margin: EdgeInsets.only(left: 16, right: 16),
      ),
    ],
  );

}