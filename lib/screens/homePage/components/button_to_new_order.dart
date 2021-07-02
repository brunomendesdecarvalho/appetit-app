import 'package:appetit/screens/newOrderPage/new_order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InkWell orderButton(context) {
  return InkWell(
    child: Card(
      margin: EdgeInsets.only(left: 16, right: 16),
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
    onTap: () => {Navigator.of(context).pushNamed(NewOrderPage.tag)},
  );
}
