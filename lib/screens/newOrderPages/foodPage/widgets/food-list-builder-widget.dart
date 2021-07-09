import 'package:flutter/material.dart';

import '../food-page-widget.dart';

class FoodTitle extends StatelessWidget {
  String title;

  FoodTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 290, top: 23, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${this.title}",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}

class FoodItemsCuscuz extends StatefulWidget {
  @override
  _FoodItemsCuscuzState createState() => _FoodItemsCuscuzState();
}

class _FoodItemsCuscuzState extends State<FoodItemsCuscuz> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FoodTiles(
          name: "Cuscuz simples",
          imageUrl: "cuscuz_simples.jpg",
          description: "Milho ou arroz",
          price: 2.25,
        ),
        FoodTiles(
          name: "Cuscuz completo",
          imageUrl: 'cuscuz_completo.jpg',
          description: "Milho ou arroz",
          price: 3.25,
        ),
      ],
    );
  }
}

class FoodItemsPaes extends StatefulWidget {
  @override
  _FoodItemsPaesState createState() => _FoodItemsPaesState();
}

class _FoodItemsPaesState extends State<FoodItemsPaes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FoodTiles(
          name: "Pão caseiro",
          imageUrl: "pao_caseiro.jpg",
          description: "",
          price: 2.25,
        ),
        FoodTiles(
          name: "Pão caseiro completo",
          imageUrl: 'pao_caseiro_completo.jpg',
          description: "",
          price: 3.25,
        ),
        FoodTiles(
          name: "Misto quente",
          imageUrl: 'misto_quente.jpg',
          description: "",
          price: 3.00,
        ),
        FoodTiles(
            name: "Língua de sogra (pq.)",
            imageUrl: 'lingua_de_sogra.jpg',
            description: "",
            price: 2.00
        ),
        FoodTiles(
            name: "Língua de sogra (gr.)",
            imageUrl: 'lingua_de_sogra_grande.jpg',
            description: "",
            price: 3.00
        ),
      ],
    );
  }
}