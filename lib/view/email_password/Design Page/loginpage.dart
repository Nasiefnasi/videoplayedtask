// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/email_password/Design%20Page/sign_inPage.dart';
import 'package:videoplayer/view/email_password/Design%20Page/submitwidget.dart';
import 'package:videoplayer/view/email_password/Design%20Page/textfieldwidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var control = Get.put(AuthLogincontroler());
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
                  SizedBox(
                    width: mediaqury.size.width * 0.80,
                    height: mediaqury.size.width * 0.50,
                    child: Image.asset("image/3dsign.png"),
                  ),
                  hight30,
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  hight10,
                  const Text(
                    "please login to continue using our app",
                    style: TextStyle(color: kGreycolor),
                  ),
                  hight20,
                  TextFormFieldPage(formKey: _formKey, control: control),
                  LoginSubmitButton(
                      mediaqury: mediaqury,
                      formKey: _formKey,
                      control: control),
                  hight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: kGreycolor),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  hight30,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
