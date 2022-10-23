import 'package:flutter/material.dart';
import 'package:gabo/screens/register_screen.dart';
import 'package:gabo/ui/input_decoration.dart';
import 'package:gabo/widgets/auth_background.dart';
import 'package:gabo/widgets/auth_text_button.dart';
import 'package:gabo/widgets/bottom_navigator.dart';
import 'package:gabo/widgets/card_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 250),
          CardContainer(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Text("Ingreso", style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 30),
              const _LoginForm()
            ],
          )),
          const SizedBox(height: 50),
          AuthTextButton(
              text: 'Crear cuenta',
              onPressed: () =>
                  {Navigator.pushNamed(context, RegisterScreen.routeName)}),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.number,
            onChanged: (value) => {},
            decoration: InputDecorations.authInputDecoration(
                hintText: "",
                labelText: "Celular",
                prefixIcon: Icons.phone_android_rounded),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Ingrese su celular';
              }
              String pattern = r'(3[0-9]{9})';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? "")
                  ? null
                  : "Numero de celular inválido";
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (value) => {},
              decoration: InputDecorations.authInputDecoration(
                  hintText: "",
                  labelText: "Contraseña",
                  prefixIcon: Icons.lock,
                  isPassword: true),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "La contraseña es requerida";
                }
                if (value != null && value.length < 6) {
                  return "La contraseña debe tener al menos 6 caracteres";
                }
                return null;
              }),
          const SizedBox(height: 30),
          MaterialButton(
              color: const Color.fromARGB(255, 0, 199, 186),
              disabledColor: Colors.grey,
              elevation: 0,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                Navigator.pushReplacementNamed(
                    context, BottomNavigator.routeName);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text("Ingresar",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              )),
        ]));
  }
}
