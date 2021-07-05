import 'dart:ui';

import 'package:appetit/screens/newOrderPage/widgets/food_detail_widget.dart';
import 'package:appetit/utils/price_format_real.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FoodsWidget extends StatefulWidget {
  @override
  _FoodsWidgetState createState() => _FoodsWidgetState();
}

class _FoodsWidgetState extends State<FoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            FoodTitle(title: 'Cuscuz'),
            FoodItemsCuscuz(),
            FoodTitle(title: 'Pães'),
            FoodItemsPaes(),
          ],
        ),
      ),
    );
  }
}

class FoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String description;
  double price;

  FoodTiles(
      {Key? key,
        required this.name,
        required this.imageUrl,
        required this.description,
        required this.price,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 500),
                reverseDuration: Duration(milliseconds: 500),
                child: FoodDetailsPage(name: this.name, imageUrl: this.imageUrl, price: this.price)
            )
        );
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
                              child: Text('R\$ ${realFormat.format(price)}',
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

class FoodItemsCuscuz extends StatelessWidget {
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
