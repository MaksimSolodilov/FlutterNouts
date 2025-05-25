import 'package:flutter/material.dart';
import 'Cards.dart';
import 'Settings.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const Menu(),
      
    );
  }
}
