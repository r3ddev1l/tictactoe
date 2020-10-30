import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/home_page.dart';
import 'package:tic_tac_toe/view/intro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
