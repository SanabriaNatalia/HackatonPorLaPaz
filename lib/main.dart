import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gabo/providers/user_location.dart';
import 'package:gabo/screens/login_screen.dart';
import 'package:gabo/screens/register_screen.dart';
import 'package:gabo/widgets/bottom_navigator.dart';
import 'package:provider/provider.dart';

void main() => runApp(const Diametro());

class Diametro extends StatelessWidget {
  const Diametro({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserLocation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
          BottomNavigator.routeName: (_) => const BottomNavigator(),
        },
      ),
    );
  }
}
