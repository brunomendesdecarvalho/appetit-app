import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';

Container orderText() {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
        'Informações para o pedido',
        style: TextStyle(
          fontSize: 24.0,
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
Container descriptionText() {
  return Container(
    alignment: Alignment.topLeft,
    child: Text(
        'Preencha as informações abaixo para concluir o pedido.',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        )
    ),
    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
  );
}
