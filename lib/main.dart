import 'package:appetit/screens/newOrderPage/new_order_page_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'utils/theme.dart';
import 'screens/loginPage/login_page.dart';
import 'screens/homePage/home_page.dart';

void main() => runApp(Appetit());

class Appetit extends StatelessWidget {
  // Rotas da aplicação.
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    NewOrderPage.tag: (context) => NewOrderPage(),
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
