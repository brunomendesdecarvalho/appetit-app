import 'package:appetit/screens/newOrderPage/new_order_page_food.dart';
import 'package:appetit/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

InkWell DateButton(context) {
  return InkWell(
    child: Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.black54),
            title: Transform.translate(
              offset: Offset(-20, 0),
              child: Text('Selecione uma data',
                  style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54
                ),
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: getCorTema(), size: 11.20,),
          ),
        ],
      ),
    ),
    onTap: () => {},
  );
}
