// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/model/userdetails/userprofilemodel.dart';
import 'package:videoplayer/view/userdetails/profilepage.dart';
// import 'package:machinetasklilac/model/userdetails/userprofilemodel.dart';
// import 'package:machinetasklilac/view/userdetails/profilepage.dart';

class UserProfilecontroler extends GetxController {
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
  dynamic loading = false.obs;
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

  // adduserdata(String email, BuildContext context) async {
  //   try {
  //     loading.value = true;
  //     await imageuplode();
  //     Userprofile profile = Userprofile(
  //         name: name.text,
  //         imageUrl: getimagepath,
  //         emails: email,
  //         dob: birth.text);
  //     fireinst
  //         .collection("User")
  //         .doc(auth.currentUser!.uid)
  //         .set(profile.toMap());
  //     loading.value = false;
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) {
  //         return const UserProfilePage();
  //       },
  //     ));
  //   } catch (e) {
  //     loading.value = false;
  //     Get.snackbar("Error", '${e}');
  //   }
  // }






 Future<void> addUserData(String email, BuildContext context) async {
    try {
      loading = true; // Change loading state
      String? imagePath = await imageUpload(); // Assuming imageUpload() is a function to upload images
      Userprofile profile = Userprofile(
        name: name.text,
        imageUrl: imagePath ?? "", // Set default value if imagePath is null
        emails: email,
        dob: birth.text,
      );
      await fireinst
          .collection("User")
          .doc(auth.currentUser!.uid)
          .set(profile.toMap());
      loading = false; // Change loading state
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const UserProfilePage(),
      ));
    } catch (e) {
      loading = false; // Change loading state
      Get.snackbar("Error", '$e');
    }
  }

  // Your image upload function goes here
  Future<String?> imageUpload() async {
    // Implement your image upload logic here
    // Return the image URL or null if upload fails
    return null;
  }















  verifyphonenumberOtp() async {
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
