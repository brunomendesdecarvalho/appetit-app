import 'package:appetit/screens/homePage/home_page.dart';
import 'package:appetit/screens/newOrderPage/new_order_page_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

class EndOfOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/pedido_realizado.png'),
            SizedBox(height: 26,),
            Text(
                'Pedido Realizado!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87
                ),
            ),
            SizedBox(height: 84,),
            ButtonTheme(
              minWidth: 328,
              height: 48,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          child: NewOrderPage()
                      )
                  )
                },
                padding: EdgeInsets.only(left : 14, right: 14),
                color: Color(0xFFFF8822),
                child: Text('FAZER UM NOVO PEDIDO', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 16),
            ButtonTheme(
              minWidth: 328,
              height: 48,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(color: Color(0xFFB8CC3B), width: 2),
                ),
                onPressed: () => {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          child: HomePage()
                      )
                  )
                },
                padding: EdgeInsets.symmetric(vertical : 14, horizontal: 24),
                color: Colors.white,
                child: Text('VOLTAR PARA A PÁGINA INICIAL', style: TextStyle(color: Color(0xFFB8CC3B))),
              ),
            ),
          ],
        ),
      ),
    );
  }

}