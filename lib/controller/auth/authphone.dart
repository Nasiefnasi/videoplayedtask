
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/profile/userprofile.dart';
import 'package:videoplayer/view/ath&otp/otp/otppage.dart';
import 'package:videoplayer/view/homepage/homePage.dart';
import 'package:videoplayer/view/userdetails/profilepage.dart';
// import 'package:machinetasklilac/controller/profile/userprofile.dart';
// import 'package:machinetasklilac/view/Homepage/homePage.dart';
// import 'package:machinetasklilac/view/ath&otp/otp/otppage.dart';

class Authphone extends GetxController {
  UserProfilecontroler userController = Get.find<UserProfilecontroler>();
  FirebaseAuth auth = FirebaseAuth.instance;

  // verifyphonenumber() async {
  //   try {
  //     userController.auth.verifyPhoneNumber(
  //         verificationCompleted: (PhoneAuthCredential credential) {
  //           auth.signInWithCredential(credential);
  //         },
  //         verificationFailed: (FirebaseAuthException ex) {
  //           print(
  //               "Firebase Authentication Errorqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq: ${ex.code}, ${ex.message}");
  //           Get.snackbar(
  //               "error", "Firebase Authentication Error: ${ex.message}");
  //         },
  //         codeSent: (String verificationId, int? resendtoken) {
  //           // Get.put(OtpScreen(verificationId: verificationId));
            
  //         },
  //         codeAutoRetrievalTimeout: (String verificationId) {},
  //         phoneNumber: userController.phone.text.toString());
  //   } catch (e) {
  //     print(
  //         "88888888888888888888888888888888888888888888888888888888888888888888888888888$e");
  //     Get.snackbar("error", "$e");
  //   }
  //   // userController.auth.verifyPhoneNumber(
  //   //     verificationCompleted: (PhoneAuthCredential credential) {},
  //   //     verificationFailed: (FirebaseAuthException ex) {},
  //   //     codeSent: (String verificationId, int? resendtoken) {

  //   //       Get.put(OtpScreen(verificationId: verificationId));
  //   //     },
  //   //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   //     phoneNumber: userController.phone.text.toString());
  // }
  verifyPhoneNumber(BuildContext context) async {
  try {
    await userController.auth.verifyPhoneNumber(
      phoneNumber: 'userController.phone.text.toString().trim()}',
      verificationCompleted: (PhoneAuthCredential credential) {
        auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException ex) {
        print("Firebase Authentication Error: ${ex.code}, ${ex.message}");
        Get.snackbar("Error", "Firebase Authentication Error: ${ex.message}");
      },
      codeSent: (String verificationId, int? resendtoken) {
        Get.put(OtpScreen(verificationId: verificationId));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return OtpScreen(verificationId: verificationId);
          
        },));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } catch (e) {
    print("Error during phone verification: $e");
    Get.snackbar("Error", "Error during phone verification: $e");
  }
}

  // otpverify(String verificationId) {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId,
  //         smsCode: userController.otpcontroller.text.toString());
  //     auth.signInWithCredential(credential).then((value) {
  //       Get.put(const HomePage());
  //     });
  //   } catch (ex) {
  //     print(
  //         "2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222$ex");
  //     log(ex.toString());
  //     Get.snackbar("error", "$ex");
  //   }
  // }
   otpverify(String verificationId) {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: userController.otpcontroller.text.toString().trim(),
    );
    auth.signInWithCredential(credential).then((value) {
      Get.put(const UserProfilePage());
    });
  } catch (ex, stackTrace) {
    print("Error during OTP verification: ${ex}");
    print("StackTrace: ${stackTrace}");
    Get.snackbar("Error", "Error during OTP verification: $ex");
  }
}

}
