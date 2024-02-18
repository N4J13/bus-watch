import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final PhosphorIcon prefixIcon;
  final Function(String?)? validator;
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) => validator != null ? validator!(value) : null,
    );
  }
}
