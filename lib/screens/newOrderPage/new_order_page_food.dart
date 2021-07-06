import 'package:appetit/screens/newOrderPage/widgets/food_detail_widget.dart';
import 'package:appetit/screens/newOrderPage/components/progress_bar_and_text.dart';
import 'package:appetit/utils/price_format_real.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'components/back_button.dart';
import 'components/search.dart';
import 'new_order_page_client.dart';


class NewOrderPage extends StatefulWidget {
  static String tag = 'new-order-page';
  static RxDouble totalValue = new RxDouble(0);
  NewOrderPage({Key? key}) : super(key: key);

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  static double totalPrice = 0;

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
            visible: NewOrderPage.totalValue.value != 0,
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
        _awaitSelectedAndQuantity(context);
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
  void _awaitSelectedAndQuantity(BuildContext context) async {

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
      NewOrderPage.totalValue.value += widget.isSelectedAndQuantityAndPrice[2];
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


class AdvanceBar extends StatefulWidget {
  AdvanceBar(
      {Key? key,})
      : super(key: key);

  @override
  _AdvanceBarState createState() => _AdvanceBarState();
}

class _AdvanceBarState extends State<AdvanceBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: getCorTema(),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Total: R\$ ${realFormat.format(NewOrderPage.totalValue.value)}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ),
          Spacer(),
          Text(
            'Avançar',
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
          IconButton(
            splashRadius: 10,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 12,
            ), onPressed: () {
              NewOrderPage.totalValue.value = 0;
              setState(() {});
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    reverseDuration: Duration(milliseconds: 500),
                    child: ClientsPage()
                )
            );
          },
          ),
        ],
      ),
    );

  }
}
