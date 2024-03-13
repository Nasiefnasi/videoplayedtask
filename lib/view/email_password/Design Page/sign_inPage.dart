import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/controller/profile/userprofile.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/email_password/Design%20Page/loginpage.dart';
import 'package:videoplayer/view/textfiled/modeltextformfiled.dart';

// class SignPage extends StatelessWidget {
//   const SignPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final cntol = Get.put(Authcontroler());
//     var mediaqury = MediaQuery.of(context);

//     return Scaffold(resizeToAvoidBottomInset: true,
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               Align(
//                   alignment: Alignment.center,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         hight30,
//                         SizedBox(
//                             width: mediaqury.size.width * 0.80,
//                             height: mediaqury.size.width * 0.50,
//                             child: Image.asset("image/otpchar.png")),
//                         hight30,
//                         const Text(
//                           "Sign Up",
//                           style: TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.bold),
//                         ),
//                         hight5,
//                         const Text(
//                           "Please fill the details and create account",
//                           style: TextStyle(color: kGreycolor),
//                         ),
//                         hight20,
//                         TextFormfildWidget(
//                           obscureText: false,
//                           contro: cntol.name,
//                           hinttext: 'Name',
//                           validators: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your Name';
//                             }
//                             return null;
//                           },
//                           Iconss: const Icon(Icons.person),
//                         ),
//                         TextFormfildWidget(
//                           obscureText: false,
//                           contro: cntol.email,
//                           hinttext: 'E-mail',
//                           // validators: (value) {
//                           //   if (value == null || value.isEmpty) {
//                           //     return 'Please enter your email';
//                           //   }
//                           //   return null;
//                           // },
//                           Iconss: const Icon(Icons.mail),
//                         ),
//                         TextFormfildWidget(
//                           obscureText: false,
//                           contro: cntol.password,
//                           hinttext: 'Password',
//                           validators: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                           Iconss: const Icon(Icons.lock),
//                         ),
//                         hight10,
//                         SizedBox(
//                           width: mediaqury.size.width * 0.4,
//                           height: mediaqury.size.height * 0.05,
//                           child: ElevatedButton(
//                             style: const ButtonStyle(
//                                 backgroundColor: MaterialStatePropertyAll(
//                                     Colors.greenAccent)),
//                             onPressed: () async {
//                               await cntol.signpage(context, _formKey);
//                               cntol.name.clear();
//                               cntol.email.clear();
//                               cntol.password.clear();
//                             },
//                             child: cntol.loading.value
//                                 ? const CircularProgressIndicator(
//                                     color: Colors.white,
//                                   )
//                                 : const Text(
//                                     "Submit",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20),
//                                   ),
//                           ),
//                         ),
//                       ])),
//               hight20,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Already have an account? ",
//                     style: TextStyle(color: kGreycolor),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const LoginPage(),
//                           ),
//                           (route) => false);
//                     },
//                     child: const Text(
//                       "Login",
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final cntol = Get.put(Authcontroler());
    final cntrol = Get.put(Usercontroler());
    var mediaqury = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: mediaqury.size.width * 0.80,
                    height: mediaqury.size.width * 0.50,
                    child: Image.asset("image/otpchar.png"),
                  ),
                  Container(
                    width: mediaqury.size.width * .6,
                    height: mediaqury.size.height * .29,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // You can add additional decoration properties here
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Obx(() => cntrol.imageshow.value == ""
                          ? Image.asset("image/otpchar.png", fit: BoxFit.cover)
                          : Image.file(File(cntrol.imageshow.value),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  hight10,
                  Align(
                      alignment: const Alignment(.7, 4),
                      child: ElevatedButton.icon(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.green)),
                          onPressed: () {
                            cntrol.showimage(ImageSource.camera);
                          },
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.white60,
                          ),
                          label: const Text(
                            "camera",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundColor: Colors.green,
                      //   child: IconButton(onPressed: () {}, icon: Icon(Icons.camera,color: Colors.white,)),
                      // )
                      ),
                  const SizedBox(height: 30),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Please fill the details and create account",
                    style: TextStyle(color: kGreycolor),
                  ),
                  const SizedBox(height: 20),
                  TextFormfildWidget(
                    obscureText: false,
                    contro: cntrol.name,
                    hinttext: 'Name',
                    validators: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                    Iconss: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 10),
                  TextFormfildWidget(
                    obscureText: false,
                    contro: cntrol.phone,
                    hinttext: 'phone',
                    validators: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                    Iconss: const Icon(Icons.mail),
                  ),
                  TextFormfildWidget(
                    obscureText: false,
                    contro: cntrol.birth,
                    hinttext: 'Birth',
                    validators: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your birth';
                      }
                      return null;
                    },
                    Iconss: const Icon(Icons.mail),
                  ),
                  TextFormfildWidget(
                    obscureText: false,
                    contro: cntol.email,
                    hinttext: 'E-mail',
                    validators: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    Iconss: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 10),
                  TextFormfildWidget(
                    obscureText: false,
                    contro: cntol.password,
                    hinttext: 'Password',
                    validators: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    Iconss: const Icon(Icons.lock),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: mediaqury.size.width * 0.4,
                    height: mediaqury.size.height * 0.05,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.greenAccent),
                      ),
                      onPressed: () async {
                        await cntol.signpage(context, _formKey);
                       await cntrol.adduserdata();
                        cntol.name.clear();
                        cntol.email.clear();
                        cntol.password.clear();
                      },
                      child: Obx(
                        () => cntol.loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                "Submit",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: kGreycolor),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
