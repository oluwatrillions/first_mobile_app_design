import 'package:flutter/material.dart';

class FormController extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final String? hintText;

  const FormController({
    super.key,
    required this.labelText,
    required this.textController,
    required this.obscureText,
    required this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: hintText,
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
