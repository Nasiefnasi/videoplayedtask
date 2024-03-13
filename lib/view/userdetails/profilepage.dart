// // ignore_for_file: file_names

// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:videoplayer/controller/profile/userprofile.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/textfiled/modeltextformfiled.dart';
// import 'package:machinetasklilac/controller/profile/userprofile.dart';
// import 'package:machinetasklilac/view/core.dart';
// import 'package:machinetasklilac/view/textfiled/modeltextformfiled.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage
({super.key});

  @override
  Widget build(BuildContext context) {
    final cntrol = Get.put(UserProfilecontroler());
    var mediaqury = MediaQuery.of(context);
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
                              ? Image.asset("image/otpchar.png",
                                  fit: BoxFit.cover)
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
                                cntrol.showimage(ImageSource.gallery);
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
                      const Text(
                        "Enter your Details",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      hight5,
                      const Text(
                        "Please fill the details and create account",
                        style: TextStyle(color: kGreycolor),
                      ),

                      // Container(
                      //   width: mediaqury.size.width * .6,
                      //   height: mediaqury.size.height * .2,
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           image: AssetImage("image/otpchar.png")),
                      //       color: Colors.amberAccent,
                      //       borderRadius: BorderRadius.circular(20)),
                      // ),
                      hight20,
                      TextFormfildWidget(
                        obscureText: false,
                        contro: cntrol.name,
                        hinttext: 'Name',
                        Iconss: const Icon(Icons.person),
                      ),
                      TextFormfildWidget(
                        obscureText: false,
                        contro: cntrol.email,
                        hinttext: 'E-mail',
                        Iconss: const Icon(Icons.mail),
                      ),
                      TextFormfildWidget(
                        obscureText: false,
                        contro: cntrol.birth,
                        hinttext: 'Birth',
                        Iconss: const Icon(Icons.date_range_sharp),
                      ),
                      hight10,
                      SizedBox(
                        width: mediaqury.size.width * 0.4,
                        height: mediaqury.size.height * 0.05,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.greenAccent)),
                          onPressed: () async {
                            // await cntrol.adduserdata();
                            // await  cntol.UserProfilePage
                            //(context);
                            //   cntol.name.clear();
                            //   cntol.email.clear();
                            //   cntol.password.clear();
                          },
                          child: cntrol.loading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                        ),
                      ),
                    ])),
            hight20,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "Already have an account? ",
            //       style: TextStyle(color: kGreycolor),
            //     ),
            //     // InkWell(
            //     //   onTap: () {
            //     //     Navigator.pushAndRemoveUntil(
            //     //         context,
            //     //         MaterialPageRoute(
            //     //           builder: (context) => const LoginPage(),
            //     //         ),
            //     //         (route) => false);
            //     //   },
            //     //   child: const Text(
            //     //     "Login",
            //     //     style: TextStyle(color: Colors.blue),
            //     //   ),
            //     // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
