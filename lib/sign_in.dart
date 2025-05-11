import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smartfarm_with_iot_app/create_an_account.dart';
import 'package:smartfarm_with_iot_app/firebase_functions.dart';
import 'package:smartfarm_with_iot_app/home/home_screen.dart';
import 'package:smartfarm_with_iot_app/home/tabs/home_tab.dart';
import 'package:smartfarm_with_iot_app/provider/my_provider.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/Logo (2).png",
                  width: 70,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  "Welcome Back!",
                  style: GoogleFonts.inder(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "Log in to your Smart Farm account to continue",
                  style: GoogleFonts.inder(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  "managing and optimizing your farm and garden.",
                  style: GoogleFonts.inder(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.transparent.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.email)),
              ),
              const SizedBox(height: 10),
              // TextField(
              //   controller: passwordController,
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //     hintText: "Password",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(18),
              //         borderSide: BorderSide.none),
              //     fillColor: Colors.transparent.withOpacity(0.1),
              //     filled: true,
              //     prefixIcon: const Icon(Icons.remove_red_eye),
              //   ),
              //   obscureText: true,
              // ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.transparent.withOpacity(0.1),
                  filled: true,
                  prefixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isPasswordVisible,
              ),


              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text(
                    "Remember this device",
                    style: GoogleFonts.inder(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: Column(
                  children: [
                    Text(
                      "By continuing, you agree to Smart Farm IoT",
                      style: GoogleFonts.inder(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          "Terms &",
                          style: GoogleFonts.inder(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                        Text(
                          "Conditions",
                          style: GoogleFonts.inder(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                        Text(
                          "and",
                          style: GoogleFonts.inder(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        Text(
                          "Privacy Policy",
                          style: GoogleFonts.inder(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseFunctions.loginUser(
                      emailController.text, passwordController.text,
                      onSuccess: (label) {
                    provider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routeName, (route) => false,
                        arguments: label);
                  }, onError: (error) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        content: Text(error),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Okay!!")),
                        ],
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.afacad(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final email = emailController.text.trim();
                          if (email.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("ِAlert"),
                                content: Text(
                                    "Please enter your email address first."),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Good"),
                                  )
                                ],
                              ),
                            );
                            return;
                          }
                          try {
                            await FirebaseFunctions.resetPassword(email);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Sent"),
                                content: Text(
                                    "A password reset link has been sent to $email"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  )
                                ],
                              ),
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                    " An error occurred while trying to send the link::$e"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Forgot password?",
                          style: GoogleFonts.inder(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account?",
                        style: GoogleFonts.inder(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAnAccountScreen()),
                          );
                        },
                        child: Text(
                          "Create account",
                          style: GoogleFonts.inder(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_signin_button/button_list.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/home/home_screen.dart';
//
//
//
// class SignIn extends StatelessWidget {
//   SignIn({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Image.asset(
//               "assets/images/Logo (2).png",
//               width: 70,
//             ),
//           ),
//           Text(
//             "Welcome Back!",
//             style: GoogleFonts.inder(
//                 fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             "Log in to your Smart Farm account to continue",
//             style: GoogleFonts.inder(
//                 fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             "managing and optimizing your farm and garden.",
//             style: GoogleFonts.inder(
//                 fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 fillColor: Colors.grey[200],
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 labelText: "Email Address",
//                 labelStyle: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 fillColor: Colors.grey[200],
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 labelText: "Password",
//                 labelStyle: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black),
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Checkbox(value: false, onChanged: (value) {}),
//               Text(
//                 "Remember this device",
//                 style: GoogleFonts.inder(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "By continuing, you agree to Smart Farm IoT",
//                 style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Terms &",
//                 style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.green),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Conditions",
//                 style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.green),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "and",
//                 style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Privacy Policy",
//                 style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.green),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen(),));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: EdgeInsets.symmetric(horizontal: 150),
//                 minimumSize: Size.fromRadius(30),
//                 shape: ContinuousRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)),
//                 elevation: 15,
//                 side: BorderSide(
//                   color: Colors.green,
//                 ),
//               ),
//               child: Text(
//                 "Log In",
//                 style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             "or",
//             style: GoogleFonts.inder(
//               fontSize: 22,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SignInButton(
//                 Buttons.Apple,
//                 mini: true,
//                 onPressed: () {},
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               SignInButton(
//                 Buttons.Facebook,
//                 mini: true,
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
