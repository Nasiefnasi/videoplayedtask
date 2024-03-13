// import 'package:companytask/firebase_options.dart';
// import 'package:companytask/view/Login_sign_Page/loginPage/loginpage.dart';
// import 'package:firebase_core/firebase_core.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/firebase_options.dart';
// import 'package:machinetasklilac/firebase_options.dart';
// import 'package:machinetasklilac/view/ath&otp/authphone/authPhone.dart';
// import 'package:machinetasklilac/view/userdetails/profilepage.dart';
import 'package:videoplayer/view/ath&otp/authphone/authPhone.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PhoneAuth ());
  }
}