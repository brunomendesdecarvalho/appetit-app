import 'package:appetit/screens/newOrderPage/widgets/food_widget.dart';
import 'package:appetit/screens/newOrderPage/components/progress_bar.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
            DescriptionText('Preencha as informações abaixo para concluir o pedido.'),
            ProgressBarAndText(),
            search(),
            FoodsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: AdvanceBar(),
    );
  }
}

class AdvanceBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: getCorTema(),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Total: R\$ 3,25',
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
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 12,
            ), onPressed: () {
            // // Navigator.push(
            // //     context,
            // //     PageTransition(
            // //         type: PageTransitionType.topToBottom,
            // //         child: ClientsPage()
            //     )
            // );
          },
          ),
        ],
      ),
    );
  }
}