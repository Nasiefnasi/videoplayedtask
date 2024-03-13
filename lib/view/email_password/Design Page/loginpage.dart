// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:videoplayer/view/core.dart';
// import 'package:videoplayer/view/email_password/Design%20Page/sign_inPage.dart';
// import 'package:videoplayer/view/textfiled/modeltextformfiled.dart';
// // import 'package:machine_task_businexperts/core.dart';
// // import 'package:machine_task_businexperts/view/Design%20Page/forgotPassword.dart';
// // import 'package:machine_task_businexperts/view/Design%20Page/sign_inPage.dart';
// // import 'package:machine_task_businexperts/view/textfiled/modeltextformfiled.dart';
// // import 'package:get/get.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // final crotl = Get.put(Authcontroller());
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     getdetailsdatabase();
//   }

//   String? getemail;
//   String? getpassword;

//   void getdetailsdatabase() async {
//     // final prefs = await SharedPreferences.getInstance();
//     // final savedEmail = prefs.getString("emailKey");
//     // final savedPassword = prefs.getString("passwordKey");

//     // if (savedEmail != null && savedPassword != null) {
//     //   crotl.loginemail.text = savedEmail;
//     //   crotl.loginpassword.text = savedPassword;
//     //   getemail = savedEmail;
//     //   getpassword = savedPassword;

//     //   crotl.signIn(context);

//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaqury = MediaQuery.of(context);
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,

//       body: SafeArea(
//           child: ListView(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 hight30,

//                 // ignore: sized_box_for_whitespace
//                 Container(
//                   width: mediaqury.size.width * 0.80,
//                   height: mediaqury.size.width * 0.50,
//                   // color: Colors.black,
//                   child: Image.asset("image/3dsign.png"),
//                   // Lottie.asset('asset/animation/animation_lk3s1v1o.json'),
//                 ),
//                 hight30,

//                 // https://asset-cdn.lottiefiles
//                 const Text(
//                   "Login",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//                 hight10,
//                 const Text(
//                   "please login to continue using our app",
//                   style: TextStyle(color: kGreycolor),
//                 ),
//                 hight20,

//                 const TextFormfildWidget(
//                     // contro: crotl.loginemail,
//                     hinttext: 'E-mail',
//                     Iconss: Icon(Icons.mail)),
//                 const TextFormfildWidget(
//                     // contro: crotl.loginpassword,
//                     hinttext: 'Password',
//                     Iconss: Icon(Icons.lock)),

//                 // Padding(
//                 //   padding: const EdgeInsets.all(15.0),
//                 //   child: Row(
//                 //     mainAxisAlignment: MainAxisAlignment.end,
//                 //     children: [
//                 //       const Spacer(),
//                 //       GestureDetector(
//                 //         onTap: () {
//                 //           Navigator.push(
//                 //               context,
//                 //               MaterialPageRoute(
//                 //                 builder: (context) => ForgotPasswordPage(),
//                 //               ));
//                 //         },
//                 //         child: const Text(
//                 //           "forgot password",
//                 //           style: TextStyle(color: kbuttoncolorblue),
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // Obx(
//                 //   () =>
//                 SizedBox(
//                   width: mediaqury.size.width * 0.4,
//                   height: mediaqury.size.height * 0.05,
//                   child: ElevatedButton(
//                     style: const ButtonStyle(
//                         backgroundColor:
//                             MaterialStatePropertyAll(Colors.greenAccent)),
//                     onPressed: () {
//                       // crotl.signIn(context);
//                     },
//                     child:
//                         //  crotl.loading.value
//                         // ? const CircularProgressIndicator(
//                         //     color: Colors.white,
//                         //   )
//                         const Text(
//                       "Login",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                     ),
//                   ),
//                 ),
//                 // ),
//                 hight20,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Don't have an account?",
//                       style: TextStyle(color: kGreycolor),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SignPage(),
//                             ));
//                       },
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     )
//                   ],
//                 ),
//                 hight30,
//               ],
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }
// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/email_password/Design%20Page/sign_inPage.dart';
import 'package:videoplayer/view/email_password/Design%20Page/submitwidget.dart';
import 'package:videoplayer/view/email_password/Design%20Page/textfieldwidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var control = Get.put(AuthLogincontroler());
  var mediaqury;

  @override
  Widget build(BuildContext context) {
    mediaqury = MediaQuery.of(context);
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
                  SizedBox(
                    width: mediaqury.size.width * 0.80,
                    height: mediaqury.size.width * 0.50,
                    child: Image.asset("image/3dsign.png"),
                  ),
                  hight30,
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  hight10,
                  const Text(
                    "please login to continue using our app",
                    style: TextStyle(color: kGreycolor),
                  ),
                  hight20,
                  TextFormFieldPage(formKey: _formKey, control: control),
                 
                  LoginSubmitButton(
                      mediaqury: mediaqury,
                      formKey: _formKey,
                      control: control),
                  hight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: kGreycolor),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  hight30,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
