import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';

Padding search() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: TextField(
      onChanged: (value) {
        // filterSearchResults(value);
      },
      // controller: editingController,
      decoration: InputDecoration(
      hintText: "Digite a sua busca aqui",
      prefixIcon: Icon(Icons.search, color: getCorTema()),
      border: UnderlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: Colors.black45)
      ),
      ),
    ),
  );
}
