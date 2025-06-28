import 'package:flutter/material.dart';

class Socials extends StatelessWidget {
  const Socials({super.key, required this.onPressed, required this.icon});

  final void Function() onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
