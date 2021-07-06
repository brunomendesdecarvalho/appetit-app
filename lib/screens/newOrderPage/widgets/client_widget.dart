import 'dart:ui';

import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widget que construirá o corpo da página.
class ClientsWidget extends StatefulWidget {
  static RxInt quantity = RxInt(0); // Gerenciador de estado para a quantidade de clientes selecionados.
  @override
  _ClientsWidgetState createState() => _ClientsWidgetState();
}

class _ClientsWidgetState extends State<ClientsWidget> with GetxServiceMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          ClientTitle(),
          Expanded(
            child: Clients(function: countSelectedClients),
          ),
        ],
      ),
    );
  }

  // Função para incrementar ou decrementar o gerenciador de estado na medida em que o cliente for selecionado ou não
  void countSelectedClients(bool isClicked) {
    if(isClicked) {
      ClientsWidget.quantity.value++;
    } else {
      ClientsWidget.quantity.value--;
    }
  }
}

// Widget do card de clientes.
class ClientTiles extends StatefulWidget {
  final String name;
  final String imageUrl;
  final Function function;

  const ClientTiles(
      {Key? key,
        required this.name,
        required this.imageUrl,
        required this.function,
        })
      : super(key: key);

  @override
  _ClientTilesState createState() => _ClientTilesState();
}

class _ClientTilesState extends State<ClientTiles> {
  bool _isClicked = false; // se o card foi selecionado


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() =>
        {
          this._isClicked = !this._isClicked,
        });
        widget.function(_isClicked);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: Card(
                color: (this._isClicked) ? getCorTema() : Colors.white,
                elevation: 0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('assets/' + widget.imageUrl),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: (this._isClicked) ? Colors.white : Colors.black87,
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

// Widget com o título da lista de clientes.
class ClientTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
              "Meus clientes",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
          ),
                ),
        ),
      ],
    );
  }
}

// Widget para criar e organizar os cards em listas.
class Clients extends StatelessWidget {
  final Function function;
  Clients({Key? key, required this.function});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ClientTiles(
            name: "Rick Sanchez",
            imageUrl: "rick_sanchez.jpg",
            function: function,
        ),
      ClientTiles(
            name: "Vivi Ornitier",
            imageUrl: 'vivi_ornitier.jpg',
            function: function,
        ),
        ClientTiles(
            name: "Naruto Uzumaki",
            imageUrl: 'naruto_uzumaki.jpg',
            function: function,
        ),
      ],
    );
  }
}