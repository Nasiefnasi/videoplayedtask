// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_import, empty_catches, non_constant_identifier_names, unnecessary_null_comparison, empty_statements

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videoplayer/model/userdetails/userprofilemodel.dart';
import 'package:videoplayer/view/email_password/Design%20Page/loginpage.dart';
import 'package:videoplayer/view/videoplayer/playervideo.dart';

class AuthLogincontroler extends GetxController {
  FirebaseFirestore fireinst = FirebaseFirestore.instance;
  File? image;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birth = TextEditingController();
  String getimagepath = '';
  String imagePath = '';
  String firebasegetimage = "";
  Map<String, dynamic> userData = {};
  var imageshow = ''.obs;
  TextEditingController otpcontroller = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController resetmail = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  var loading = false.obs;

//
  loginusers(BuildContext context) async {
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      print("Login successful");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return const VideoPlayerPage();
        },
      ));
    } catch (e) {
      print("Login failed: $e");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("Invalid email or password. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } finally {
      loading.value = false;
    }
  }

  forgotpassword() async {
    try {
      loading.value = true;
      await auth.sendPasswordResetEmail(email: resetmail.text);
      Get.put(const LoginPage());
      Get.snackbar("Send the link", 'Email');
      loading.value = false;
      resetmail.clear();
    } catch (e) {
      Get.snackbar("Error", "$e");
      loading.value = false;
    }
  }

  signpage(BuildContext context, GlobalKey<FormState> FormKeys) async {
    try {
      loading.value = true;

      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print("Login successful");

      await addUserData(email.text, context);
      Get.snackbar("successfully", "");

      loading.value = false;
    } catch (e) {
      Get.snackbar("Error", "");
    }
  }

  Logout(BuildContext context) async {
    await auth.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false);
    Get.snackbar("LogOut", "");
  }

  showimage(ImageSource imageSource) async {
    try {
      XFile? imagepick = await ImagePicker().pickImage(source: imageSource);
      if (imagepick != null) {
        imagePath = imagepick.path;
        imageshow.value = imagepick.path;
      }
    } catch (e) {
      Get.snackbar(
        "error",
        'No image seleccted',
      );
    }
  }

  Future<void> imageuplode() async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDicImage = referenceRoot.child("image");
    Reference referenceImageUplod =
        referenceDicImage.child(auth.currentUser!.uid);

    try {
      loading.value = true;
      // Check if imagePath is not null
      if (imagePath != null && imagePath.isNotEmpty) {
        await referenceImageUplod.putFile(File(imagePath));
        getimagepath = await referenceImageUplod.getDownloadURL();
      } else {
        Get.snackbar("Error", 'Image is not uploaded');
        throw 'Image path is empty';
      }
      loading.value = false;
    } catch (error) {
      loading.value = false;
      Get.snackbar("Error", 'Image is not uploaded: $error');
    }
  }

  Future<void> addUserData(String email, BuildContext context) async {
    try {
      loading.value = true;
      await imageuplode();
      Userprofile profile = Userprofile(
        name: name.text,
        imageUrl: getimagepath,
        emails: email,
        dob: birth.text,
      );
      await fireinst
          .collection("User")
          .doc(auth.currentUser!.uid)
          .set(profile.toMap());
      loading.value = false;
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const VideoPlayerPage(),
      ));
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", '$e');
    }
  }

  Future<String?> imageUpload() async {
    return null;
  }

  verifyphonenumberOtp() async {
    auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {},
        codeSent: (String verificationId, int? resendtoken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phone.text.toString());
  }

  fetchUserProfileImageURL() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("User")
          .doc(auth.currentUser?.uid)
          .get();

      if (snapshot.exists) {
        final Data = snapshot.data() as Map<String, dynamic>;
        return Data as String?;
      } else {
        return null;
      }
    } catch (error) {
      print("Error fetching user profile image URL: $error");
      return null;
    }
  }
}
