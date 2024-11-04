import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'AboutPage.dart';  // Import de la page AboutPage
import 'SignUpPage.dart'; // Importez la page SignUpPage
import 'apropos.dart';  // Import de la page apropos
import 'loginpage.dart'; // Importez la page de connexion


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Définir LoginPage comme écran initial
      debugShowCheckedModeBanner: false,
    );
  }
}