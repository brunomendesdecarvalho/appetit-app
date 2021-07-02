import 'package:appetit/screens/homePage/components/button_to_new_order.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/material.dart';
import 'components/orders_card.dart';
import 'components/search.dart';
import 'components/welcome_text.dart';

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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                TitleText('Olá, Alessandra!'),
                SizedBox(height: 32.0),
                orderButton(context),
                search(),
                Container(
                  child: createCard(),
                ),
              ],
            ),
      ),
        ),
    );
  }
}
