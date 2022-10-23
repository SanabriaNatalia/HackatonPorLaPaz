import 'package:flutter/material.dart';
import 'package:gabo/widgets/bottom_navigator.dart';

void main() => runApp(const Diametro());

class Diametro extends StatelessWidget {
  const Diametro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigator(),
    );
  }
}
