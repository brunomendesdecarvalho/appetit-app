import 'package:flutter/material.dart';

InkWell orderButton() {
  return InkWell(
    child: Card(
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add, color: Color(0xFFFF8822)),
            title: Transform.translate(
              offset: Offset(-20, 0),
              child: Text(
                  'FAZER NOVO PEDIDO',
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
