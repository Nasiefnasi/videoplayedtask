// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';

import 'package:videoplayer/view/ath&otp/authphone/submitwidget.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/textfiled/modeltextformfiled.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final _formKey = GlobalKey<FormState>();
  final cntol = Get.put(AuthLogincontroler());
  var mediaqury;
  @override
  Widget build(BuildContext context) {
    mediaqury = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hight30,
                  hight30,
                  hight30,
                  SizedBox(
                    width: mediaqury.size.width * 0.80,
                    height: mediaqury.size.width * 0.50,
                    child: Image.asset("image/3dsign.png"),
                  ),
                  hight30,
                  const Text(
                    "Enter Your Phone number",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  hight20,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormfildWidget(
                          contro: cntol.phone,
                          hinttext: 'Phone Number',
                          Iconss: const Icon(Icons.lock),
                          obscureText: false,
                          validators: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  hight30,
                  Authsubmit(),
                  hight20,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
