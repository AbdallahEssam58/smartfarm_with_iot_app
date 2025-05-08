import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartfarm_with_iot_app/sign_in.dart';
import 'package:smartfarm_with_iot_app/sign_up.dart';

class CreateAnAccountScreen extends StatelessWidget {
  static const String routeName = "CreateAnAccount";

  CreateAnAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 454.h,
                child: Image.asset(
                  "assets/images/Farm2.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 150.h,
                left: 0,
                right:0,
                child: Center(
                  child: Image.asset(
                    "assets/images/Logo (2).png",
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "Create an account",
            textAlign: TextAlign.center,
            style: GoogleFonts.inder(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.h),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.w),
          //   child: SignInButton(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30.r),
          //     ),
          //     Buttons.Google,
          //     text: "Continue with Google",
          //     onPressed: () {},
          //   ),
          // ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SignInButtonBuilder(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              text: 'Continue with Email',
              icon: Icons.email,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              backgroundColor: Colors.green[700]!,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Row(
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
                    "Log In",
                    style: GoogleFonts.inder(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}














// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/button_builder.dart';
// import 'package:flutter_signin_button/button_list.dart';
// import 'package:flutter_signin_button/button_view.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/sign_in.dart';
// import 'package:smartfarm_with_iot_app/sign_up.dart';
//
//
// class CreateAnAccountScreen extends StatelessWidget {
//   static const String routeName = "CreateAnAccount";
//
//   CreateAnAccountScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Stack(
//             children: [
//               Image.asset(
//                 "assets/images/Farm2.png",
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//               Center(
//                 child: Image.asset("assets/images/Logo (2).png"),
//                 heightFactor: 3,
//               ),
//             ],
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             "Create an account",
//             style: GoogleFonts.inder(
//               fontSize: 27,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: SignInButton(
//           //     shape: RoundedRectangleBorder(
//           //       borderRadius: BorderRadius.circular(20),
//           //     ),
//           //     Buttons.Apple,
//           //     onPressed: () {},
//           //   ),
//           // ),
//           SizedBox(
//             height: 5,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(7.0),
//             child: SignInButton(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               Buttons.Google,
//               text: "Continue with Google",
//               onPressed: () {
//                 //  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()),);
//               },
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SignInButtonBuilder(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               text: 'Continue with Email',
//               icon: Icons.email,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SignUp()),
//                 );
//               },
//               backgroundColor: Colors.green[700]!,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               children: [
//                 Text(
//                   textAlign: TextAlign.center,
//                   "Already have an account?",
//                   style: GoogleFonts.inder(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//                 // SizedBox(
//                 //   width: 5,
//                 // ),
//                 // Text(
//                 //   "Log In",
//                 //   style: GoogleFonts.inder(
//                 //     fontSize: 22,
//                 //     fontWeight: FontWeight.w400,
//                 //     color: Colors.green,
//                 //   ),
//                 // ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()),);
//                   },
//                   child: Text(
//                     "Log In",
//                     style: GoogleFonts.inder(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.green),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }