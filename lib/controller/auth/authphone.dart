// ignore_for_file: unused_import, unused_catch_stack

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/view/ath&otp/otp/otppage.dart';

class Authphone extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final cntol = Get.put(AuthLogincontroler());

  verifyPhoneNumber(BuildContext context) async {
    try {
      await cntol.auth.verifyPhoneNumber(
        phoneNumber: 'userController.phone.text.toString().trim()}',
        verificationCompleted: (PhoneAuthCredential credential) {
          auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException ex) {
          Get.snackbar("Error", "Firebase Authentication Error: ${ex.message}");
        },
        codeSent: (String verificationId, int? resendtoken) {
          Get.put(OtpScreen(verificationId: verificationId));
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return OtpScreen(verificationId: verificationId);
            },
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.snackbar("Error", "Error during phone verification: $e");
    }
  }

  otpverify(String verificationId) {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: cntol.otpcontroller.text.toString().trim(),
      );
      auth.signInWithCredential(credential).then((value) {});
    } catch (ex, stackTrace) {
      Get.snackbar("Error", "Error during OTP verification: $ex");
    }
  }
}
