import 'package:flutter/material.dart';
import 'package:progIV_BII/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  String _emailToLogin = 'rodmatheus99@gmail.com';
  String _passwordToLogin = 'teste123';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Vai, escreve algo :D",
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                ),
                onChanged: (text) {
                  setState(() {
                    _email = text;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  hintText: "Digita a senha ae krl",
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                onChanged: (text) {
                  setState(() {
                    _password = text;
                  });
                },
              ),
              RaisedButton(
                textColor: Colors.white,
                onPressed: () {
                  if (_email == _emailToLogin &&
                      _password == _passwordToLogin) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } else {
                    print("Você não conseguiu logar :/");
                  }
                },
                child: Text("Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
