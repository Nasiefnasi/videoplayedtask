
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/view/textfiled/modeltextformfiled.dart';

class TextFormFieldPage extends StatelessWidget {
  const TextFormFieldPage({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.control,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final AuthLogincontroler control;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormfildWidget(
            obscureText: false,
            contro: control.email,
            hinttext: 'E-mail',
            Iconss: const Icon(Icons.mail),
            validators: (value) {
              if (value == null) {
                return 'Please enter your email';
              } else if (!GetUtils.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          TextFormfildWidget(
            contro: control.password,
            hinttext: 'Password',
            Iconss: const Icon(Icons.lock),
            obscureText: true,
            validators: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}