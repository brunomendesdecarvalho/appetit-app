import 'package:appetit/screens/homePage/components/new-order-button.dart';
import 'package:flutter/material.dart';
import 'components/orders-card.dart';
import 'components/welcome-text.dart';

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
                welcomeText(),
                bottomLine(),
                orderButton(),
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
