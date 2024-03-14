// ignore_for_file: file_names, sort_child_properties_last, unused_local_variable, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';

import 'package:videoplayer/controller/auth/authphone.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/textfiled/modeltextformfiled.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.verificationId});
  String verificationId;

  @override
  Widget build(BuildContext context) {
    // final usercontol = Get.put(UserProfilecontroler());
    final authcontol = Get.put(Authphone());
    final cntol = Get.put(AuthLogincontroler());

    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: SizedBox(
        height: mediaquery.height,
        width: mediaquery.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.none,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: mediaquery.height * .30,
              width: mediaquery.width * .9,
              child: Card(
                  child: Column(
                    children: [
                      hight30,
                      const Text(
                        'Enter Your Otp',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      hight20,
                      TextFormfildWidget(
                          obscureText: false,
                          contro: cntol.otpcontroller,
                          hinttext: "Otp",
                          Iconss: Icon(Icons.mail)),
                      ElevatedButton(
                          onPressed: () async {
                            await authcontol.otpverify(verificationId);
                          },
                          child: const Text("Submit")),
                    ],
                  ),
                  elevation: 5,
                  color: const Color.fromARGB(171, 254, 254, 253),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      )),
    );
  }
}
