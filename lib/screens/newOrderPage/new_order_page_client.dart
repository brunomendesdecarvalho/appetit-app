import 'package:appetit/screens/newOrderPage/widgets/client_widget.dart';
import 'package:appetit/screens/newOrderPage/widgets/food_widget.dart';
import 'package:appetit/screens/newOrderPage/components/progress_bar.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'components/back_button.dart';
import 'components/search.dart';

class ClientsPage extends StatefulWidget {
  static String tag = 'clients-page';
  ClientsPage({Key? key}) : super(key: key);

  @override
  _ClientsPageState createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {

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
            ProgressBarAndText('Para quem você está vendendo?', '2 de 3', 67),
            search(),
            ClientsWidget(),
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
              '3 clientes selecionados',
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
            // //         type: PageTransitionType.rightToLeft,
            //            duration: Duration(milliseconds: 500),
            //            reverseDuration: Duration(milliseconds: 500),
            // //         child: DateOfPaymentPage()
            //     )
            // );
          },
          ),
        ],
      ),
    );
  }
}