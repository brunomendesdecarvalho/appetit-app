import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
              Container(

              ),
            ],
          ),
      ),
    );
  }
}
