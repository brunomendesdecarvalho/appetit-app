import 'package:appetit/screens/newOrderPage/widgets/food_widget.dart';
import 'package:appetit/screens/newOrderPage/components/progress_bar.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/back_button.dart';
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
            TitleText('Informações para o pedido'),
            // bottomLine(),
            DescriptionText('Preencha as informações abaixo para concluir o pedido.'),
            ProgressBarAndText(),
            search(),
            FoodsWidget(),

          ],
        ),
      ),
    );
  }
}