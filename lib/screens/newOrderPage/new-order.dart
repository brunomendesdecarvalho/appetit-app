import 'package:appetit/screens/newOrderPage/widgets/food.dart';
import 'package:appetit/screens/newOrderPage/components/progress-bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/back-button.dart';
import 'components/order-text.dart';
import 'components/search.dart';

class NewOrderPage extends StatefulWidget {
  static String tag = 'new-order-page';
  NewOrderPage({Key? key}) : super(key: key);

  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: backButton(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orderText(),
            bottomLine(),
            descriptionText(),
            ProgressBarAndText(),
            search(),
            FoodsWidget(),

          ],
        ),
      ),
    );
  }
}