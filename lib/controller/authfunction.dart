// // ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_import, empty_catches, non_constant_identifier_names

// import 'package:companytask/view/Login_sign_Page/loginPage/loginpage.dart';
// import 'package:companytask/view/homepage/homePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';

// class Authcontroler extends GetxController {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController resetmail = TextEditingController();
//   TextEditingController name = TextEditingController();

//   FirebaseAuth auth = FirebaseAuth.instance;
//   var loading = false.obs;

// //
//   loginusers(BuildContext context) async {
//     loading.value = true;
//     try {
//       await auth.signInWithEmailAndPassword(
//         email: email.text,
//         password: password.text,
//       );
//       print("Login successful");
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) {
//           return const HomePage();
//         },
//       ));
      
//     } catch (e) {
//       print("Login failed: $e");
     
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Login Failed"),
//             content: const Text("Invalid email or password. Please try again."),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop(); 
//                 },
//                 child: const Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     } finally {
//       loading.value = false;
//     }
//   }

//   forgotpassword() async {
//     try {
//       loading.value = true;
//       await auth.sendPasswordResetEmail(email: resetmail.text);
//       Get.put(const LoginPage());
//       Get.snackbar("Send the link", 'Email');
//       loading.value = false;
//       resetmail.clear();
//     } catch (e) {
//       Get.snackbar("Error", "$e");
//       loading.value = false;
//     }
//   }

//   signpage(BuildContext context) async {
//     try {
//       loading.value = true;
//       await auth.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);
//       print("Login successful");
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) {
//           return const HomePage();

//         },
//       ));
//       Get.snackbar("successfully", "");

//       loading.value = false;
//       email.clear();
//       password.clear();
//     } catch (e) {
//       Get.snackbar("Error", "");
//     }
//   }

//   Logout(BuildContext context) async {
//     await auth.signOut();
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(
//           builder: (context) => const LoginPage(),
//         ),
//         (route) => false);
//     Get.snackbar("LogOut", "");
//   }
// }
