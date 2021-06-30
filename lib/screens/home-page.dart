import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';
import 'orders-card.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _elements = [
    {'topicName': 'GridView.count', 'group': 'GridView Type'},
    {'topicName': 'GridView.builder', 'group': 'GridView Type'},
    {'topicName': 'GridView.custom', 'group': 'GridView Type'},
    {'topicName': 'GridView.extent', 'group': 'GridView Type'},
    {'topicName': 'ListView.builder', 'group': 'ListView Type'},
    {'topicName': 'StatefulWidget', 'group': 'Type of Widget'},
    {'topicName': 'ListView', 'group': 'ListView Type'},
    {'topicName': 'ListView.separated', 'group': 'ListView Type'},
    {'topicName': 'ListView.custom', 'group': 'ListView Type'},
    {'topicName': 'StatelessWidget', 'group': 'Type of Widget'},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                    'Olá, Alessandra!',
                    style: TextStyle(
                        fontSize: 32.0,
                        color: getCorTema(),
                    )
                ),
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              ),
              const Divider(
                height: 8,
                thickness: 2,
                indent: 16,
                endIndent: 104,
                color: Color(0xFFB8CC3B),
              ),
            InkWell(
              child: Card(
                elevation: 1,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       ListTile(
                        leading: Icon(Icons.add, color: Color(0xFFFF8822)),
                        title: Transform.translate(
                          offset: Offset(-20, 0),
                          child: Text(
                            'FAZER NOVO PEDIDO',
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
              onTap: () => {},
            ),
              Container(
                child: createCard(),
              ),
            ],
          ),
      ),
    );
  }
}
