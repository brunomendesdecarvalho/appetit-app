import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '/utils/theme.dart';
import 'components/login_form.dart';
import 'components/login_header.dart';

class LoginPage extends StatefulWidget {
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

  ReactiveTextField loginField(String campo) {
    return ReactiveTextField(
      formControlName: (campo == 'E-mail') ? 'email' : 'password',
      textInputAction: TextInputAction.next,
      obscureText: (campo == 'E-mail') ? false : _obscureText,
      decoration: InputDecoration(
        labelText: campo,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: getCorTema(), width: 2.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        suffixIcon: (campo == 'E-mail') ? null : IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: getCorTema(),
          ),
          onPressed: _toggle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final logo = Image.asset('assets/logo.png', scale: .8,);
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
            BuildForm(email, password),
            forgotLabel
          ],
        ),
      ),
    );
  }
}
