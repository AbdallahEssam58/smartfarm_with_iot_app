import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartfarm_with_iot_app/firebase_functions.dart';
import 'package:smartfarm_with_iot_app/setup_farm.dart';
import 'package:smartfarm_with_iot_app/sign_in.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Image.asset(
                  "assets/images/Logo (2).png",
                  width: 100.w,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to",
                    style: GoogleFonts.inder(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    "Smart Farm",
                    style: GoogleFonts.inder(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "Create an account to access Smart Farm, and start \nto set up your farm and garden.",
                textAlign: TextAlign.center,
                style: GoogleFonts.afacad(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15.h),

              // _buildTextField("First Name"),
              // _buildTextField("Last Name"),
              // _buildTextField("Email Address"),
              // _buildTextField("Password (8+ Characters)", isPassword: true),
              TextField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: "First Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.transparent.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person)),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                    hintText: "Last Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Colors.transparent.withOpacity(0.1),
                    filled: true,
                    prefixIcon: const Icon(Icons.person)),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none),
                  fillColor: Colors.transparent.withOpacity(0.1),
                  filled: true,
                  prefixIcon: const Icon(Icons.email),
                ),
                obscureText: false,
              ),
              const SizedBox(height: 20),
              // TextField(
              //   controller: passwordController,
              //   decoration: InputDecoration(
              //     hintText: "Password (8+ Characters)",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(18),
              //         borderSide: BorderSide.none),
              //     fillColor: Colors.transparent.withOpacity(0.1),
              //     filled: true,
              //     prefixIcon: const Icon(Icons.remove_red_eye_sharp),
              //   ),
              //   obscureText: true,
              // ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Password (8+ Characters)",
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
              SizedBox(height: 10.h),
              _buildTermsAndConditions(),

              SizedBox(height: 10.h),
              _buildSignupButton(context),

              SizedBox(height: 10.h),
              _buildLogin(context),

              SizedBox(height: 20.h),
              // Text(
              //   "or",
              //   style: GoogleFonts.inder(
              //     fontSize: 18.sp,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(height: 20.h),

              // SignInButton(
              //   Buttons.Google,
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "By continuing, you agree to Smart Farm IoT",
              style: GoogleFonts.inder(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              "& Terms",
              style: GoogleFonts.inder(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Conditions",
              style: GoogleFonts.inder(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              "and",
              style: GoogleFonts.inder(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              "Privacy Policy",
              style: GoogleFonts.inder(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        onPressed: () {
          FirebaseFunctions.createAccountAuth(
              emailController.text, passwordController.text,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              onSuccess: () {
                Navigator.pushNamed(context, SetUpFarmScreen.routeName);
              }, onError: (error) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(error),
                actions: [
                  ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Cancel")),
                  ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Ok")),
                ],
              ),
            );
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        child: Text(
          "Sign up",
          style: GoogleFonts.inder(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLogin(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
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
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Text(
                "Login",
                style: GoogleFonts.inder(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_signin_button/button_list.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/setup_farm.dart';
//
// class SignUp extends StatelessWidget {
//   SignUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         shadowColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//        //  leading: IconButton(
//        //    onPressed: () {},
//        //    icon: Icon(Icons.arrow_back),
//        //    iconSize: 30,
//        //    color: Colors.black,
//        //  ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//          padding: EdgeInsets.only(bottom: 50,top: 50),
//           child: Column(
//             children: [
//               Center(
//                 child: Image.asset(
//                   "assets/images/Logo (2).png",
//                   width: 70,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Welcome to",
//                     style: GoogleFonts.inder(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 7,
//                   ),
//                   Text(
//                     "Smart Farm",
//                     style: GoogleFonts.inder(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.green),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Create an account to access Smart Farm, and start",
//                     style: GoogleFonts.inder(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "to set up your farm and garden.",
//                     style: GoogleFonts.inder(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey[200],
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     labelText: "First Name",
//                     labelStyle: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey[200],
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     labelText: "Last Name",
//                     labelStyle: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey[200],
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     labelText: "Email Address",
//                     labelStyle: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey[200],
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     labelText: "Password (8+ Characters)",
//                     labelStyle: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "By continuing, you agree to Smart Farm IoT",
//                     style: GoogleFonts.inder(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                   SizedBox(width: 5),
//                   Text(
//                     "&Terms",
//                     style: GoogleFonts.inder(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.green),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Conditions",
//                     style: GoogleFonts.inder(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.green),
//                   ),
//                   SizedBox(width: 5),
//                   Text(
//                     "and",
//                     style: GoogleFonts.inder(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black),
//                   ),
//                   SizedBox(width: 5),
//                   Text(
//                     " Privacy Policy",
//                     style: GoogleFonts.inder(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.green),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context, MaterialPageRoute(builder: (context) => SetUpFarmScreen(),));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: EdgeInsets.symmetric(horizontal: 150),
//                     minimumSize: Size.fromRadius(30),
//                     shape: ContinuousRectangleBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     elevation: 15,
//                     side: BorderSide(
//                       color: Colors.green,
//                     ),
//                   ),
//                   child: Text(
//                     "Continue",
//                     style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "or",
//                 style: GoogleFonts.inder(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // SignInButton(
//                   //   Buttons.Apple,
//                   //   mini: true,
//                   //   onPressed: () {},
//                   // ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   // SignInButton(
//                   //   Buttons.Google,
//                   //   text: "Sign up with Google",
//                   //   onPressed: () {},
//                   // )
//                   SignInButton(
//                     Buttons.Google,
//                     onPressed: () {},
//                   )
//                   // SignInButton(
//                   //   Buttons.Facebook,
//                   //   mini: true,
//                   //   onPressed: () {},
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
