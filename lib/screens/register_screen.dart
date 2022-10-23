import 'package:flutter/material.dart';
import 'package:gabo/screens/home_screen.dart';
import 'package:gabo/screens/login_screen.dart';
import 'package:gabo/ui/input_decoration.dart';
import 'package:gabo/widgets/auth_background.dart';
import 'package:gabo/widgets/auth_text_button.dart';
import 'package:gabo/widgets/bottom_navigator.dart';
import 'package:gabo/widgets/card_container.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/register';

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
              Text("Registro", style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 30),
              const _RegisterForm()
            ],
          )),
          const SizedBox(height: 30),
          AuthTextButton(
              text: '¿Ya tienes cuenta?',
              onPressed: () =>
                  {Navigator.pushNamed(context, LoginScreen.routeName)}),
          const SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: "", labelText: "Nombre", prefixIcon: Icons.email),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return "El nombre es requerido";
              }
              String pattern = r'(^[a-zA-Z ]*$)';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? "") ? null : "Nombre inválido";
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: "Celular",
                prefixIcon: Icons.phone_android_rounded,
                isPassword: false),
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
          const SizedBox(height: 15),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
                hintText: "",
                labelText: "Correo electrónico",
                prefixIcon: Icons.email_rounded),
          ),
          const SizedBox(height: 15),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
                hintText: "", labelText: "Contraseña", prefixIcon: Icons.lock),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Ingrese su contraseña';
              }
              if (value!.length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          MaterialButton(
              color: const Color.fromARGB(255, 0, 199, 186),
              disabledColor: Colors.grey,
              elevation: 0,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                Navigator.pushNamed(context, BottomNavigator.routeName);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text("Registrarme",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              )),
        ]));
  }
}
