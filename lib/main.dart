import 'package:flutter/material.dart';
import 'package:porto_hack_santos/screens/main_screen.dart';
import 'package:porto_hack_santos/screens/navio_screen.dart';
import 'package:porto_hack_santos/screens/perfil_screen.dart';
import 'package:porto_hack_santos/screens/second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        SecondScreen.id: (context) => SecondScreen(),
        PerfilScreen.id: (context) => PerfilScreen(),
        NavioScreen.id: (context) => NavioScreen(),
      },
    );
  }
}
