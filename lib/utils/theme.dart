import 'package:flutter/material.dart';

// Definição do tema laranja da aplicação.
Map<int, Color> color1 =
{
  50:Color.fromRGBO(229, 122, 31, .1),
  100:Color.fromRGBO(229, 122, 31, .2),
  200:Color.fromRGBO(229, 122, 31, .3),
  300:Color.fromRGBO(229, 122, 31, .4),
  400:Color.fromRGBO(229, 122, 31, .5),
  500:Color.fromRGBO(229, 122, 31, .6),
  600:Color.fromRGBO(229, 122, 31, .7),
  700:Color.fromRGBO(229, 122, 31, .8),
  800:Color.fromRGBO(229, 122, 31, .9),
  900:Color.fromRGBO(229, 122, 31, 1),
};

MaterialColor theme = MaterialColor(0xFFFF8822, color1);

// Função para retornar a cor #FF8822.
MaterialColor getCorTema() {
  return theme;
}