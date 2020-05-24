import 'package:flutter/material.dart';
import 'package:nac2_app_fiap/util/util.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String _user = "";
  String _senha = "";

  final InputBorder _border = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Util.rosaFiap,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/images/logofiap-preto.png",
                          scale: 1.3,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                          focusedBorder: _border,
                          enabledBorder: _border,
                          labelStyle: TextStyle(
                            color: Util.rosaFiap,
                          ),
                          icon: Icon(
                            Icons.person,
                            color: Util.rosaFiap,
                          ),
                          labelText: 'usuário',
                        ),
                        onSaved: (value) => _user = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        obscureText: true,
                        decoration: new InputDecoration(
                          focusedBorder: _border,
                          enabledBorder: _border,
                          labelStyle: TextStyle(
                            color: Util.rosaFiap,
                          ),
                          icon: Icon(
                            Icons.lock,
                            color: Util.rosaFiap,
                          ),
                          labelText: 'senha',
                        ),
                        onSaved: (value) => _senha = value,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        formKey.currentState.save();

                        if (_user == "admin" && _senha == "admin123") {
                          Navigator.pushNamed(context, "/home");

                        } else {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text(
                                'Verifique seu login e senha!',
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: new Text(
                          "login",
                          style: TextStyle(
                            fontSize: 22,
                            color: Util.rosaFiap,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
