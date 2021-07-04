import 'package:appetit/screens/endPage/order_finished.dart';
import 'package:appetit/screens/homePage/components/button_to_new_order.dart';
import 'package:appetit/screens/homePage/components/option_button.dart';
import 'package:appetit/screens/newOrderPage/widgets/client_widget.dart';
import 'package:appetit/screens/newOrderPage/components/progress_bar_and_text.dart';
import 'package:appetit/utils/theme.dart';
import 'package:appetit/utils/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_material_pickers/helpers/show_date_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

import 'components/back_button.dart';
import 'components/button_to_select_date.dart';
import 'components/search.dart';

class DateOfPaymentPage extends StatefulWidget {
  static String tag = 'date-of-payment-page';
  DateOfPaymentPage({Key? key}) : super(key: key);

  @override
  _DateOfPaymentPageState createState() => _DateOfPaymentPageState();
}

class _DateOfPaymentPageState extends State<DateOfPaymentPage> {
  DateTime date = DateTime.now().subtract(Duration(days:1));
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

            OptionButton(context, 'Sim'),
            SizedBox(height: 8.0,),
            OptionButton(context, 'Não'),
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
                onPressed: (date.isBefore(DateTime.now())) ? null : () => {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: EndOfOrderPage()
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

