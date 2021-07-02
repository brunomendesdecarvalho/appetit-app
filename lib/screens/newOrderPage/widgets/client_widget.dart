import 'dart:ui';

import 'package:flutter/material.dart';

class ClientsWidget extends StatefulWidget {
  @override
  _ClientsWidgetState createState() => _ClientsWidgetState();
}

class _ClientsWidgetState extends State<ClientsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          ClientTitle(),
          Expanded(
            child: Clients(),
          ),
        ],
      ),
    );
  }
}

class ClientTiles extends StatelessWidget {
  String name;
  String imageUrl;

  ClientTiles(
      {Key? key,
        required this.name,
        required this.imageUrl,
        })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

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
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}

class ClientTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 290, top: 23, bottom: 16),
      child: Container(
              child: Text(
                  "Meus clientes",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
              ),
            ),
          )

    );
  }
}

class Clients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ClientTiles(
            name: "Rick Sanchez",
            imageUrl: "rick_sanchez.jpg",
        ),
      ClientTiles(
            name: "Vivi Ornitier",
            imageUrl: 'vivi_ornitier.jpg',
        ),
        ClientTiles(
            name: "Naruto Uzumaki",
            imageUrl: 'naruto_uzumaki.jpg',
        ),
      ],
    );
  }
}

