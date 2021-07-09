import 'package:appetit/screens/newOrderPages/clientPage/widgets/advance-bar-widget.dart';
import 'package:appetit/screens/newOrderPages/clientPage/widgets/client-list-widget.dart';
import 'package:appetit/screens/newOrderPages/commons/progress-bar-and-text.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/back-button.dart';
import '../commons/search.dart';

class ClientPage extends StatefulWidget {
  static String tag = 'clients-page';
  ClientPage({Key? key}) : super(key: key);

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: getCorTema(),
      ),
      // Barra inferior só aparecerá se houver pelo menos um dos clientes selecionados.
      bottomNavigationBar: Obx(
          () => Visibility(
            visible: ClientsWidget.quantity.value != 0,
            child: AdvanceBar()
          )
      )
    );
  }
}
