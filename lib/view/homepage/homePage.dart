// ignore_for_file: file_names, sort_child_properties_last

// import 'package:companytask/controller/authfunction.dart';
// import 'package:companytask/view/core.dart';

import 'package:flutter/material.dart';
import 'package:videoplayer/view/core.dart';
// import 'package:get/get.dart';
// import 'package:machinetasklilac/view/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final authcontol = Get.put(AuthLogincontroler());

    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
          child: SizedBox(
        height: mediaquery.height,
        width: mediaquery.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.none,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: mediaquery.height * .30,
              width: mediaquery.width * .9,
              child: Card(
                  child: Column(
                    children: [
                      hight30,
                      const Text(
                        'Home Page',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      hight20,
                      ElevatedButton(
                          onPressed: () {
                            // authcontol.Logout(context);
                          },
                          child: const Text("LogOut")),
                    ],
                  ),
                  elevation: 5,
                  color: const Color.fromARGB(171, 254, 254, 253),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ],
        ),
      )),
    );
  }
}
