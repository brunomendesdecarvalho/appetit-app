import 'package:appetit/screens/newOrderPages/finishOrderPage/finish-order-page-widget.dart';
import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'client-list-widget.dart';

class AdvanceBar extends StatefulWidget {
  AdvanceBar({Key? key,}) : super(key: key);
  @override
  _AdvanceBarState createState() => _AdvanceBarState();
}

class _AdvanceBarState extends State<AdvanceBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: getCorTema(),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              '${ClientsWidget.quantity.value} clientes selecionados',
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
            splashRadius: 10,
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 12,
            ),
            // Limpeza do estado para resetar as seleções ao final da operação.
            onPressed: () {
              ClientsWidget.quantity.value = 0;
              setState(() {});
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 500),
                      reverseDuration: Duration(milliseconds: 500),
                      child: FinishOrderPage()
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}