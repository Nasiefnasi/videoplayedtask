import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    super.key,
    required this.mediaqury,
    required GlobalKey<FormState> formKey,
    required this.control,
  }) : _formKey = formKey;

  final  mediaqury;
  final GlobalKey<FormState> _formKey;
  final AuthLogincontroler control;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: mediaqury.size.width * 0.4,
        height: mediaqury.size.height * 0.05,
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Colors.greenAccent),
          ),
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              control.loginusers(context);
              control.email.clear();
              control.password.clear();
            }
          },
          child: control.loading.value
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}