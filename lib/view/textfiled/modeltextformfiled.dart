// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFormfildWidget extends StatelessWidget {
  const TextFormfildWidget(
      {super.key,
      required this.hinttext,
      required this.Iconss,
      this.contro,
      this.obscureText,
      this.validators});
  final hinttext;
  final Iconss;
  final contro;
  final obscureText;
  final validators;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.blue,
        elevation: 5,
        child: TextFormField(
          obscureText: obscureText,
          validator: validators,
          controller: contro,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinttext,
              hintStyle: const TextStyle(),
              prefixIcon: Iconss,
              prefixIconColor: Colors.redAccent),
        ),
      ),
    );
  }
}
