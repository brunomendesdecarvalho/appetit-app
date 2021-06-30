import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '/utils/theme.dart';
import 'home-page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final form = fb.group({
    'email': ['', Validators.required, Validators.email],
    'password': ['', Validators.required, Validators.minLength(9)],
  });

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void _onSubmit() {
    print('Hello Reactive Forms!!!');
  }

  Padding loginText(double fontsize, Color color, String content) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        content,
        style: TextStyle(fontSize: fontsize, color: color),
        textAlign: TextAlign.center,
      ),
    );
  }

  ReactiveTextField loginField(String campo) {
    return ReactiveTextField(
            formControlName: (campo == 'E-mail') ? 'email' : 'password',
            textInputAction: TextInputAction.next,
            obscureText: (campo == 'E-mail') ? false : _obscureText,
            decoration: InputDecoration(
              labelText: campo,
              contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 40.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: getCorTema(), width: 2.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
              suffixIcon: (campo == 'E-mail') ? null : IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: getCorTema(),
                ),
                  onPressed: _toggle,
            ),
          ),
    );
  }

  ReactiveForm buildForm(ReactiveTextField email, ReactiveTextField senha) {
    return ReactiveForm (
      formGroup: this.form,
      child: Column(
        children: <Widget>[
          email,
          SizedBox(height: 24.0),
          senha,
          SizedBox(height: 24.0),
          ReactiveFormConsumer(
            builder: (context, form, child) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                ),
                onPressed: form.valid ? _onSubmit : null,
                padding: EdgeInsets.symmetric(vertical : 14, horizontal: 140),
                color: Color(0xFFFF8822),
                child: Text('Entrar', style: TextStyle(color: Colors.white)),
              ),
            );
            }
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'appetit-logo',
      child: Image.asset('assets/logo.png'),
    );

    final title = loginText(24.0, getCorTema(), 'Seja bem-vindo!');
    final subtitle = loginText(16.0, Colors.black54, 'Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar no seu dia.');
    final email = loginField('E-mail');
    final password = loginField('Senha');

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
            buildForm(email, password),
            // email,
            // SizedBox(height: 8.0),
            // password,
            // SizedBox(height: 24.0),
            // loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
