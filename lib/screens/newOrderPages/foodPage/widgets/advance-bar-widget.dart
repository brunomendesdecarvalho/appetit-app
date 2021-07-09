import 'package:appetit/screens/newOrderPages/clientPage/client-page.dart';
import 'package:appetit/utils/price_format_real.dart';
import 'package:appetit/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../food-page-widget.dart';

class AdvanceBar extends StatefulWidget {
  AdvanceBar(
      {Key? key,})
      : super(key: key);

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
              'Total: R\$ ${realFormat.format(FoodPage.totalValue.value)}',
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
            ), onPressed: () {
            FoodPage.totalValue.value = 0; // Resetar a página
            setState(() {});
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    reverseDuration: Duration(milliseconds: 500),
                    child: ClientPage()
                )
            );
          },
          ),
        ],
      ),
    );

  }
}
