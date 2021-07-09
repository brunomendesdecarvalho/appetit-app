import 'package:appetit/screens/homePage/home-page-widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

final form = fb.group({
  'email': ['', Validators.required, Validators.email, Validators.equals('teste@teste.com')],
  'password': ['', Validators.required, Validators.minLength(6), Validators.equals('123456')],
});

ReactiveFormConsumer buildLoginForm() {
  return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ButtonTheme(
            minWidth: 328,
            height: 48,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: form.valid ? () => {Navigator.of(context).pushNamed(HomePage.tag)} : null,
              padding: EdgeInsets.symmetric(vertical : 14, horizontal: 140),
              color: Color(0xFFFF8822),
              child: Text('Entrar', style: TextStyle(color: Colors.white)),
            ),
          ),
        );
      }
  );
}

ReactiveForm BuildForm(ReactiveTextField email, ReactiveTextField senha) {
  return ReactiveForm (
    formGroup: form,
    child: Column(
      children: <Widget>[
        email,
        SizedBox(height: 24.0),
        senha,
        SizedBox(height: 24.0),
        buildLoginForm(),
      ],
    ),
  );
}
