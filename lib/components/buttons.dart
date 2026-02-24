import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  const MyButtons({super.key, required this.onPressed, required this.text});

  final void Function()? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 214, 213, 214),
      ),
      child: Wrap(
        children: [
          Text(
            text ?? "",
            style: TextStyle(
              color: Color.fromARGB(255, 26, 22, 12),
              fontSize: 16.0,
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.login, color: Color.fromARGB(255, 39, 30, 30), size: 20),
        ],
      ),
    );
  }
}
