import 'package:appetit/utils/price_format_real.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget da página de detalhes da comida.
class FoodDetailsPage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double price;

  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
  FoodDetailsPage({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // Se a primeira ou a segunda opção está selecionada.
  bool firstIsChecked = false;
  bool secondIsChecked = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: getCorTema(),
            ),
            splashRadius: 20,
            // Retorna que a comida foi selecionada para a página da listagem de
            // comidas, para que o card fique laranja.
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ),
        body:
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                TitleText('Detalhes do pedido'),
                DescriptionText('Caso queira, aproveite para adicionar alguma observação para este pedido'),
                Card(
                    color: Colors.white,
                    elevation: 0.2,
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage('assets/${widget.imageUrl}'),
                                ),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                        )
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 19),
                                      child: Text('R\$ ${realFormat.format(widget.price)}',
                                        style: TextStyle(
                                            fontSize: 16
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // Se for algum cuscuz, vai ter esse subtítulo.
                                subtitle: (widget.name.contains('Cuscuz')) ? Text('Milho ou arroz',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    )
                                ) : null,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16.0, bottom: 4.0),
                      child: Text('Opções',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
                      child: Text('Escolha uma das opções de massas disponíveis abaixo.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54
                          )
                      ),
                    ),
                  ],
                ),
                Card(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  elevation: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        // Se uma opção for selecionada, a outra será desselecionada
                        leading: Checkbox(
                            checkColor: Colors.white,
                            value: secondIsChecked,
                            onChanged: (bool? value) {
                              if(!firstIsChecked) {
                                setState(() {
                                  secondIsChecked = value!;
                                });
                              } else if (firstIsChecked) {
                                setState(() {
                                  firstIsChecked = !firstIsChecked;
                                  secondIsChecked = value!;
                                });
                              }
                            },
                            shape: CircleBorder(),
                            side: BorderSide(color: getCorTema())
                        ),
                        title: Transform.translate(
                          offset: Offset(-20, 0),
                          child: Text(
                            // Se for cuscuz, 'cuscuz de milho', se não, 'massa
                            // fina', por todas as demais serem pães ou derivados.
                            widget.name.contains('Cuscuz') ? 'Cuscuz de milho' : 'Massa fina',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0,),
                Card(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  elevation: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Checkbox(
                            checkColor: Colors.white,
                            value: firstIsChecked,
                            onChanged: (bool? value) {
                              if(!secondIsChecked) {
                                setState(() {
                                  firstIsChecked = value!;
                                });
                              } else if (secondIsChecked) {
                                setState(() {
                                  secondIsChecked = !secondIsChecked;
                                  firstIsChecked = value!;
                                });
                              }
                            },
                            shape: CircleBorder(),
                            side: BorderSide(color: getCorTema())
                        ),
                        title: Transform.translate(
                          offset: Offset(-20, 0),
                          child: Text(
                            widget.name.contains('Cuscuz') ? 'Cuscuz de arroz' : 'Massa grossa',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16.0, top: 24.0),
                      child: Text('Observações',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Deseja adicionar alguma obs.?',
                        ),
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Barra inferior aparecerá apenas se uma das opções forem seleciodadas.
        bottomNavigationBar: (firstIsChecked || secondIsChecked) ? AddToCartMenu(price: widget.price) : null,
      ),
    );
  }
}

class AddToCartMenu extends StatefulWidget {
  double price;

  AddToCartMenu({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  _AddToCartMenuState createState() => _AddToCartMenuState();
}

class _AddToCartMenuState extends State<AddToCartMenu> {
  int quantity = 1;
  double price = 0.0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            splashRadius: 10,
            onPressed: () {
              if (this.quantity > 1) {
                setState(() {
                  this.quantity--;
                  });
              }
            },
            icon: Icon(Icons.remove),
            color: Colors.black12,
            iconSize: 16,
          ),
          Text('${this.quantity}'),
          IconButton(
            splashRadius: 10,
            onPressed: () {setState((){this.quantity++;});},
            icon: Icon(Icons.add),
            color: getCorTema(),
            iconSize: 16,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 16, bottom: 10),
            child: ButtonTheme(
              minWidth: 184,
              height: 48,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                // Retorna a lista ['Foi escolhida a comida', 'quantidade', 'valor total desse pedido']
                onPressed: () => {
                  Navigator.pop(
                      context,
                      [true, this.quantity, this.quantity * this.widget.price]
                )
              },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 38),
                      child: Text(
                        'Adicionar',
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    Text(
                      'R\$ ${realFormat.format(this.quantity * widget.price)}',
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
            ),
      ),
          )
        ],
      ),
    );
  }
}