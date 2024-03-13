// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videoplayer/model/userdetails/userprofilemodel.dart';
import 'package:videoplayer/view/userdetails/profilepage.dart';
// import 'package:machinetasklilac/model/userdetails/userprofilemodel.dart';
// import 'package:machinetasklilac/view/userdetails/profilepage.dart';

class Usercontroler extends GetxController {
  FirebaseFirestore fireinst = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  File? image;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birth = TextEditingController();
  String getimagepath = '';
  String imagePath = '';
  var imageshow = ''.obs;
  var loading = false.obs;
  TextEditingController otpcontroller = TextEditingController();

  imageuplode() async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDicImage = referenceRoot.child("image");
    Reference referenceImageUplod =
        referenceDicImage.child(auth.currentUser!.uid);
    try {
      loading.value = true;
      await referenceImageUplod.putFile(File(imagePath));
      getimagepath = await referenceImageUplod.getDownloadURL();
      loading.value = false;
    } catch (error) {
      Get.snackbar("error", 'image is no uploded $error');
    }
  }
  // Future<void> imageUpload() async {
  //   try {
  //     if (imagePath == null || imagePath.isEmpty) {
  //       Get.snackbar("Error", "Please select an image");
  //       return;
  //     }

  //     if (auth.currentUser == null) {
  //       Get.snackbar("Error", "User not authenticated");
  //       return;
  //     }

  //     loading.value = true;

  //     Reference referenceRoot = FirebaseStorage.instance.ref();
  //     Reference referenceDicImage = referenceRoot.child("image");
  //     Reference referenceImageUplod =
  //         referenceDicImage.child(auth.currentUser!.uid);

  //     await referenceImageUplod.putFile(File(imagePath));
  //     String getimagepath = await referenceImageUplod.getDownloadURL();

  //     // Do something with the download URL if needed
  //     print("Download URL: $getimagepath");

  //     loading.value = false;
  //     Get.snackbar("Success", "Image uploaded successfully");
  //   } catch (error) {
  //     loading.value = false;
  //     Get.snackbar("Error", 'Image was not uploaded. $error');
  //   }
  // }

  showimage(ImageSource imageSource) async {
    try {
      XFile? imagepick = await ImagePicker().pickImage(source: imageSource);
      if (imagepick != null) {
        imagePath = imageshow.value = imagepick.path;
      }
    } catch (e) {
      Get.snackbar(
        "error",
        'No image seleccted',
      );
    }
  }

  adduserdata() async {
    try {
      loading.value = true;
      await imageuplode();
      Userprofile profile = Userprofile(
          name: name.text,
          imageUrl: getimagepath,
          emails: email.text,
          dob: birth.text);
      fireinst
          .collection("User")
          .doc(auth.currentUser!.uid)
          .set(profile.toMap());
      loading.value = false;
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", '${e}');
    }
  }

  verifyphonenumber() async {
    auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException ex) {},
        codeSent: (String verificationId, int? resendtoken) {
          Get.put(UserProfilePage());

        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: phone.text.toString());
  }
}
