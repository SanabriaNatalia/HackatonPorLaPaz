import 'package:flutter/material.dart';
import 'package:gabo/screens/home_screen.dart';

void main() => runApp(const Diametro());

class Diametro extends StatelessWidget {
  const Diametro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
