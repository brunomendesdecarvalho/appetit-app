import 'package:flutter/material.dart';

InkWell OptionButton(context, String text) {
  return InkWell(
    child: Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.circle_outlined, color: Color(0xFFFF8822)),
            title: Transform.translate(
              offset: Offset(-20, 0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: () => {},
  );
}
