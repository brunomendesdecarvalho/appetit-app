import 'dart:ui';

import 'package:appetit/screens/endPage/end-page-widget.dart';
import 'package:appetit/screens/newOrderPages/commons/progress-bar-and-text.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_date_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

import '../commons/back-button.dart';

class FinishOrderPage extends StatefulWidget {
  static String tag = 'finish-order-page';
  FinishOrderPage({Key? key}) : super(key: key);

  @override
  _FinishOrderPageState createState() => _FinishOrderPageState();
}

class _FinishOrderPageState extends State<FinishOrderPage> {
  DateTime date = DateTime.now().subtract(Duration(days:1)); // Menor data possível: o dia de ontem.
  bool yesIsChecked = false; // Se o checkbox do card "sim" está selecionado.
  bool noIsChecked = false; // Se o checkbox do card "sim" está selecionado.

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
            ProgressBarAndText('Finalizar pedido', '3 de 3', 100),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0, top: 24.0, bottom: 16.0),
              child: Text('O cliente já pagou?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 16, right: 16),
              elevation: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                    leading: Checkbox(
                      checkColor: Colors.white,
                      value: yesIsChecked,
                      // Se um já estiver marcado, o outro será desmarcado.
                        onChanged: (bool? value) {
                        if(!noIsChecked) {
                          setState(() {
                            yesIsChecked = value!;
                          });
                        } else if (noIsChecked) {
                          setState(() {
                            noIsChecked = !noIsChecked;
                            yesIsChecked = value!;
                          });
                        }
                      },
                      shape: CircleBorder(),
                      side: BorderSide(color: getCorTema())
                    ),
                    title: Transform.translate(
                      offset: Offset(-20, 0),
                      child: Text(
                        'Sim',
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
                      value: noIsChecked,
                      onChanged: (bool? value) {
                        if(!yesIsChecked) {
                          setState(() {
                            noIsChecked = value!;
                          });
                        } else if (yesIsChecked) {
                          setState(() {
                            yesIsChecked = !yesIsChecked;
                            noIsChecked = value!;
                          });
                        }
                      },
                      shape: CircleBorder(),
                      side: BorderSide(color: getCorTema())
                    ),
                    title: Transform.translate(
                      offset: Offset(-20, 0),
                      child: Text(
                        'Não',
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

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0, top: 24.0, bottom: 16.0),
              child: Text('Em que data o pedido foi realizado?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            InkWell(
            child: Card(
            margin: EdgeInsets.only(left: 16, right: 16),
            elevation: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.black54),
                  title: Transform.translate(
                    offset: Offset(-20, 0),
                    // A data de ontem não pode ser selecionada.
                    child: Text((date.isBefore(DateTime.now())) ? 'Selecione uma data' : DateFormat('dd/MM/yyyy').format(date),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: (date.isBefore(DateTime.now())) ? Colors.black54 : Colors.black87,
                      ),
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: getCorTema(), size: 11.20,),
                ),
              ],
              ),
            ),
            onTap: () => showMaterialDatePicker(
              title: 'Selecione uma data',
              firstDate: DateTime.now().subtract(Duration(days:1)),
              lastDate: DateTime.now().add(Duration(days:365)),
              context: context,
              selectedDate: date,
              onChanged: (value) => setState(() => date = value),
            ),
    ),
            SizedBox(height: 78,),
            ButtonTheme(
              minWidth: 328,
              height: 48,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                // O botão só será habilitado se ambos os campos "já pagou" e "data" estiverem preenchidos.
                onPressed: (date.isBefore(DateTime.now()) && (!yesIsChecked || !noIsChecked)) ? null : () => {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: EndPage()
                      )
                  )
                },
                padding: EdgeInsets.symmetric(vertical : 14, horizontal: 24),
                color: Color(0xFFFF8822),
                child: Text('FINALIZAR PEDIDO', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

