import 'package:appetit/screens/newOrderPages/finishOrderPage/finish-order-page-widget.dart';
import 'package:appetit/screens/newOrderPages/foodPage/food-page-widget.dart';
import 'package:appetit/screens/newOrderPages/clientPage/client-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'utils/theme.dart';
import 'screens/loginPage/login-page-widget.dart';
import 'screens/homePage/home-page-widget.dart';

void main() => runApp(Appetit());

class Appetit extends StatelessWidget {
  // Rotas da aplicação.
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    FoodPage.tag: (context) => FoodPage(),
    ClientPage.tag: (context) => ClientPage(),
    FinishOrderPage.tag: (context) => FinishOrderPage(),
  };

  @override
  Widget build(BuildContext context) {
    // Barra de status transparente
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Appetit',
      // Definição da cor do tema da aplicação.
      theme: ThemeData(
        primarySwatch: getCorTema(),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
