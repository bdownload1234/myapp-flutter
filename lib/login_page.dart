import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/repository.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Repository repository = Repository();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  login() async {}

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () async {
            if (_emailController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty) {
              bool response = await repository.login(
                   _emailController.text, _passwordController.text);
              if (response) {
                Navigator.of(context).popAndPushNamed('/home');
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Login Berhasil!')));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Password Salah')));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form Tidak Boleh Kosong!')));
            }
          },
          color: Color.fromRGBO(64, 75, 96, .9),
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final registerLabel = TextButton(
      child: Text(
        'Daftar Akun',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            registerLabel
          ],
        ),
      ),
    );
  }
}
