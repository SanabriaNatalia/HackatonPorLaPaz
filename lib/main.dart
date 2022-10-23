import 'package:flutter/material.dart';
import 'package:gabo/screens/login_screen.dart';
import 'package:gabo/widgets/bottom_navigator.dart';

void main() => runApp(const Diametro());

class Diametro extends StatelessWidget {
  const Diametro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        BottomNavigator.routeName: (_) => const BottomNavigator(),
      },
    );
  }
}
