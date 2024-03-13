// import 'package:companytask/controller/authfunction.dart';
// ignore_for_file: empty_constructor_bodies, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:machinetasklilac/controller/auth/authphone.dart';
import 'package:videoplayer/controller/auth/authphone.dart';

class Authsubmit extends StatelessWidget {
  const Authsubmit({super.key});

  @override
  Widget build(BuildContext context) {
    var usercotrol = Get.put(Authphone());
    var cotrol = Get.put(Authphone());
    var mediaqury = MediaQuery.of(context).size;
    return
        //  Obx(
        //   () =>
        SizedBox(
      width: mediaqury.width * 0.4,
      height: mediaqury.height * 0.05,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
        ),
        onPressed: () async {
          await usercotrol.verifyPhoneNumber(context);
        },
        child:
            // control.loading.value
            // ? const CircularProgressIndicator(
            //     color: Colors.white,
            //   )
            const Text(
          "Send Otp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      // ),
    );
  }
}
