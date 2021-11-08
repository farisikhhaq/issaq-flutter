import 'package:flutter/material.dart';
import 'package:issaq_pro/screens/home/Home.dart';
import 'package:issaq_pro/widget/widgets.dart';
import 'package:issaq_pro/widget/widgets_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  Widget _authTitle() {
    return wAuthTitle(
      title: 'Login',
      subtitle: 'Enter Your Email & Password',
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Email'),
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(hintText: 'Password'),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600]),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _forgotPassowrd() {
    return GestureDetector(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('Forgot Password ?'),
          ),
        ),
        onTap: () {
          print('Forgot Password ?');
        });
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        context: context, title: 'Login', onPressed: _loginHome);
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(onPressed: () {});
  }

  Widget _textRegister() {
    return wTextLink(
        text: 'Dont have an account yet ?', title: 'Register', onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _authTitle(),
                        _inputEmail(),
                        _inputPassword(),
                        _forgotPassowrd(),
                        _inputSubmit(),
                        wTextDivider(),
                        _googleSignIn(),
                        _textRegister(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void _loginHome() async {
    setState(() {
      _isLoading = true;
    });

    if (_email.text == 'demo@gmail.com' && _password.text == '123123') {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      print('GAGAL!');
    }
  }
}
