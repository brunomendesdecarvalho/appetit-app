import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/theme.dart';
import 'screens/login-page.dart';
import 'screens/home-page.dart';

void main() => runApp(Appetit());

class Appetit extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Appetit',
      theme: ThemeData(
        primarySwatch: getCorTema(),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}
