import 'package:flutter/material.dart';
import 'package:nac2_app_fiap/screens/home.dart';
import 'package:nac2_app_fiap/screens/login.dart';

void main() {
  runApp(FiapApp());
}

class FiapApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        "/home": (context) => Home(),
      },
    );
  }  
}