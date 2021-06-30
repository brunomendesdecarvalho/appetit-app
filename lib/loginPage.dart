import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  bool _emailValid = false;
  bool _passValid = false;
  bool _btnEnabled = false;
  static String tag = 'login-page';
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'appetit-logo',
      child: Image.asset('assets/logo.png'),
    );

    final title = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Seja bem-vindo!',
        style: TextStyle(fontSize: 24.0, color: Color(0xFFE57A1F)),
        textAlign: TextAlign.center,
      ),
    );

    final subtitle = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar no seu dia.',
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
        textAlign: TextAlign.center,
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          labelText: 'E-mail',
          hintText: 'exemplo@exemplo.com',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF8822), width: 2.0),
              borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Senha',
        hintText: 'Insira a sua senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8822), width: 2.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
          suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Color(0xFFFF8822),
              ),
              onPressed: _toggle,
        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {

        },
        padding: EdgeInsets.all(12),
        color: Color(0xFFFF8822),
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Esqueceu a senha?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            title,
            subtitle,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
