import 'dart:ui';

import 'package:flutter/material.dart';

class FoodsWidget extends StatefulWidget {
  @override
  _FoodsWidgetState createState() => _FoodsWidgetState();
}

class _FoodsWidgetState extends State<FoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          FoodTitleCuscuz(),
          Expanded(
            child: FoodItemsCuscuz(),
          ),
          FoodTitlePaes(),
          Expanded(
            child: FoodItemsPaes(),
          ),
        ],
      ),
    );
  }
}

class FoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String description;
  String price;
  String slug;

  FoodTiles(
      {Key? key,
        required this.name,
        required this.imageUrl,
        required this.description,
        required this.price,
        required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, ScaleRoute(page: FoodDetailsPage()));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: Card(
                color: Colors.white,
                elevation: 0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                                  backgroundImage: AssetImage('assets/' + imageUrl),
                                ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(name,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )
                                ),
                            Container(
                              padding: EdgeInsets.only(top: 19),
                              child: Text('R\$' + price,
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            )
                              ],
                            ),
                            subtitle: Text(description,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class FoodTitleCuscuz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 290, top: 23, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Cuscuz",
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

class FoodItemsCuscuz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        FoodTiles(
            name: "Cuscuz simples",
            imageUrl: "cuscuz_simples.jpg",
            description: "Milho ou arroz",
            price: '2,25',
            slug: "cuscuz_simples"),
        FoodTiles(
            name: "Cuscuz completo",
            imageUrl: 'cuscuz_completo.jpg',
            description: "Milho ou arroz",
            price: "3,25",
            slug: "cuscuz_completo"),
      ],
    );
  }
}
class FoodTitlePaes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 290, top: 23, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Pães",
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

class FoodItemsPaes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        FoodTiles(
            name: "Pão caseiro",
            imageUrl: "pao_caseiro.jpg",
            description: "",
            price: '2,25',
            slug: "pao_caseiro"),
        FoodTiles(
            name: "Pão caseiro completo",
            imageUrl: 'pao_caseiro_completo.jpg',
            description: "",
            price: "3,25",
            slug: "pao_caseiro_completo"),
        FoodTiles(
            name: "Misto quente",
            imageUrl: 'misto_quente.jpg',
            description: "",
            price: "3,00",
            slug: "misto_quente"),
        FoodTiles(
            name: "Língua de sogra (pq.)",
            imageUrl: 'lingua_de_sogra.jpg',
            description: "",
            price: "2,00",
            slug: "lingua_de_sogra"),
        FoodTiles(
            name: "Língua de sogra (gr.)",
            imageUrl: 'lingua_de_sogra_grande.jpg',
            description: "",
            price: "3,00",
            slug: "lingua_de_sogra_grande"),
      ],
    );
  }
}
