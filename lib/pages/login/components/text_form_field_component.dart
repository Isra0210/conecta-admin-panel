import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatelessWidget {
  const TextFormFieldComponent({
    required this.labelText,
    this.validator,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final String? Function(String?)? validator; 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: const Color(0XFF1e224c),
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 14, color: Color(0XFF1e224c)),
        contentPadding: const EdgeInsets.only(left: 30),
        hoverColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade100),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
