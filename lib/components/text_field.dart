import 'package:flutter/material.dart';

class TextController extends StatelessWidget {
  final String hintWord;
  final TextEditingController textController;

  const TextController({
    super.key,
    required this.hintWord,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hintWord,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: const Color.fromARGB(255, 50, 51, 51)),
        ),
      ),
      style: TextStyle(
        fontSize: 18,
        color: const Color.fromARGB(255, 12, 12, 12),
      ),
    );
  }
}
