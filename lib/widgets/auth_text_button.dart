import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
          overlayColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 0, 199, 186))),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black87,
        ),
      ),
    );
  }
}
