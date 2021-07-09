import 'package:appetit/screens/newOrderPages/foodPage/widgets/advance-bar-widget.dart';
import 'package:appetit/screens/newOrderPages/foodPage/widgets/food-list-builder-widget.dart';
import 'package:appetit/screens/newOrderPages/foodPage/widgets/food-detail-widget.dart';
import 'package:appetit/screens/newOrderPages/commons/progress-bar-and-text.dart';
import 'package:appetit/utils/price_format_real.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../commons/back-button.dart';
import '../commons/search.dart';


class FoodPage extends StatefulWidget {
  static String tag = 'food-page';
  static RxDouble totalValue = new RxDouble(0); // Gerenciador de estado do valor total do pedido
  FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: backButton(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleText('Informações para o pedido'),
            DescriptionText('Preencha as informações abaixo para concluir o pedido.'),
            ProgressBarAndText('O que você está vendendo?', '1 de 3', 33),
            search(),
            SingleChildScrollView(
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
          () => Visibility(
            visible: FoodPage.totalValue.value != 0,
            child: AdvanceBar(),
          )
      )
    );
  }
}


class FoodTiles extends StatefulWidget {
  String name;
  String imageUrl;
  String description;
  double price;
  List isSelectedAndQuantityAndPrice = [false, 0, 0.0];


  FoodTiles(
      {Key? key,
        required this.name,
        required this.imageUrl,
        required this.description,
        required this.price,
      })
      : super(key: key);

  @override
  _FoodTilesState createState() => _FoodTilesState();
}

class _FoodTilesState extends State<FoodTiles> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _awaitSelectedAndQuantityAndPrice(context);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: Card(
                color: (widget.isSelectedAndQuantityAndPrice[0]) ? getCorTema() : Colors.white,
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
                                        color: (widget.isSelectedAndQuantityAndPrice[0]) ? Colors.white : Colors.black87
                                    )
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 19),
                                  child: Text('R\$ ${realFormat.format(widget.price)}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: (widget.isSelectedAndQuantityAndPrice[0]) ? Colors.white : Colors.black87
                                    ),
                                  ),
                                )
                              ],
                            ),
                            subtitle: Text(widget.description,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: (widget.isSelectedAndQuantityAndPrice[0]) ? Colors.white : Colors.black54
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

  // Vai para a página de detalhes e retorna se o card foi selecionado a quantidade e o valor total.
  void _awaitSelectedAndQuantityAndPrice(BuildContext context) async {

    final isSelectedAndQuantityAndPrice = await Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 500),
            reverseDuration: Duration(milliseconds: 500),
            child: FoodDetailsPage(name: this.widget.name, imageUrl: this.widget.imageUrl, price: this.widget.price)
        )
    );
    setState(() {
      widget.isSelectedAndQuantityAndPrice = isSelectedAndQuantityAndPrice;

    });
      FoodPage.totalValue.value += widget.isSelectedAndQuantityAndPrice[2];
  }
}