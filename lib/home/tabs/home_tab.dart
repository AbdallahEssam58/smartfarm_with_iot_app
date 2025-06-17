import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smartfarm_with_iot_app/home/sensors/Fire_Detection.dart';
import 'package:smartfarm_with_iot_app/home/sensors/Humidity.dart';
import 'package:smartfarm_with_iot_app/home/sensors/Light_Intensity.dart';
import 'package:smartfarm_with_iot_app/home/sensors/Temperature.dart';
import 'package:smartfarm_with_iot_app/home/tabs/myfileds_tab.dart';
import 'package:smartfarm_with_iot_app/onboarding.dart';
import 'package:smartfarm_with_iot_app/provider/my_provider.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = "HomeTab";

  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var por = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text(
          "Hello ${por.userModel?.firstName}",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, OnboardingScreen.routeName);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/Logo (2).png",
                  width: 180,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To Your\n     Smart Farm",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2BBF5D),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Fields",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyfiledsTab()));
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7BBC5C),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Fildcard(title: 'Tomatoes', acres: '8 Acre'),
                    Fildcard(title: 'Lettuce', acres: '2 Acre'),
                    Fildcard(title: 'Rice', acres: '3 Acre'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Statistics & Instructions",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Statcard(
                        label: "Light Intensity",
                        imagePath: "assets/images/Light Intensity.png",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LightIntensity()))),
                    Statcard(
                        label: "Humidity",
                        imagePath: "assets/images/Humidity.png",
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Humidity()))),
                    Statcard(
                        label: "Fire Detection",
                        imagePath: "assets/images/Fire Detection.png",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FireDetection()))),
                    Statcard(
                        label: "Temperature",
                        imagePath: "assets/images/Temprature.png",
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Temperature()))),
                  ],
                ),
              ),

              // SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

class Fildcard extends StatelessWidget {
  final String title;
  final String acres;

  const Fildcard({super.key, required this.title, required this.acres});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 14, left: 2),
            height: 100,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage("assets/images/Lettuce.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          acres,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class Statcard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback? onTap;

  const Statcard(
      {super.key,
      required this.imagePath,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        width: 90,
        margin: EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width:90,
              height: 75,
              fit: BoxFit.contain,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                label,
                style: GoogleFonts.aBeeZee(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //  Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/home/home_screen.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Fire_Detection.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Humidity.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Light_Intensity.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Temperature.dart';
// import 'package:smartfarm_with_iot_app/home/tabs/myfileds_tab.dart';
//
//
// class HomeTab extends StatelessWidget{
//   HomeTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Container(
//           width: 120,
//           height: 30,
//           decoration: BoxDecoration(
//               color: Color(0xFFF2F3F2),
//               borderRadius: BorderRadius.circular(15)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               ImageIcon(
//                 AssetImage("assets/images/Navigation, Maps.png"),
//                 color: Colors.black,
//               ),
//               Text(
//                 "Cairo , Egypt",
//                 style: GoogleFonts.cabin(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ImageIcon(
//               AssetImage("assets/images/Bell, Notifications.png"),
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Image.asset("assets/images/Weather.png"),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "24°",
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Today is partly sunny day!",
//                 style: GoogleFonts.aBeeZee(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 66,
//             width: 375,
//             decoration: BoxDecoration(
//                 color: Color(0xFF7BBC5C),
//                 borderRadius: BorderRadius.circular(15)),
//             child: Stack(
//               children: [
//                 Image.asset(
//                   "assets/images/Frame 19.png",
//                   width: 80,
//                   height: 80,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Check our AI recommendation for\n your fields!",
//                         style: GoogleFonts.aBeeZee(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 3,
//                     ),
//                     Icon(
//                       Icons.arrow_forward,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   "My Fields",
//                   style: GoogleFonts.aBeeZee(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                     Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => MyfiledsTab(),));
//                 },
//                 child: Text(
//                   "See All",
//                   style: GoogleFonts.aBeeZee(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF7BBC5C),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 190,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Fildcard(title: 'Tomatoes', acres: '8 Acre'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Fildcard(title: 'Lettuce', acres: '2 Acre'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Fildcard(title: 'Rice', acres: '3 Acre'),
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Statistics & Instructions",
//                   style: GoogleFonts.aBeeZee(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 12,
//           ),
//            SingleChildScrollView(
//                scrollDirection: Axis.vertical,
//                child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Statcard(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) =>LightIntensity()),
//                         );
//                       },
//                           label: "Light Intensity",
//                           imagePath: "assets/images/Light Intensity.png",
//                         ),
//                     Statcard(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Humidity()),
//                         );
//                       },
//                       label: "Humidity",
//                       imagePath: "assets/images/Humidity.png",
//                     ),
//                     Statcard(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => FireDetection()),
//                         );
//                       },
//                       label: "Fire Detection",
//                       imagePath: "assets/images/Fire Detection.png",
//                     ),
//                     Statcard(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Temperature()),
//                         );
//                       },
//                       label: "Temperature",
//                       imagePath: "assets/images/Temprature.png",
//                     ),
//                   ],
//                 ),
//              ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//

// backgroundColor: Colors.white,
// appBar: AppBar(
// automaticallyImplyLeading: false,
// backgroundColor: Colors.white,
// elevation: 0,
// title: Container(
// width: 120.w,
// height: 30.h,
// decoration: BoxDecoration(
// color: Color(0xFFF2F3F2),
// borderRadius: BorderRadius.circular(15.r),
// ),
// child: Row(
// children: [
// Padding(
// padding: EdgeInsets.symmetric(horizontal: 5.w),
// child: ImageIcon(
// AssetImage("assets/images/Navigation, Maps.png"),
// color: Colors.black,
// ),
// ),
// Text(
// "Cairo , Egypt",
// style: GoogleFonts.cabin(
// fontSize: 14.sp,
// fontWeight: FontWeight.w400,
// color: Colors.black,
// ),
// ),
// ],
// ),
// ),
// actions: [
// Padding(
// padding: EdgeInsets.all(8.w),
// child: ImageIcon(
// AssetImage("assets/images/Bell, Notifications.png"),
// color: Colors.black,
// ),
// ),
// ],
// ),

// Container(
//   height: 66.r,
//   width: double.infinity,
//   decoration: BoxDecoration(
//     color: Color(0xFF7BBC5C),
//     borderRadius: BorderRadius.circular(15.r),
//   ),
//   child: Row(
//     children: [
//       Image.asset("assets/images/Frame 19.png",
//           width: 80.w, height: 80.h),
//       SizedBox(width: 10.w),
//       Expanded(
//         child: Text(
//           "Check our AI recommendation for\nyour fields!",
//           style: GoogleFonts.aBeeZee(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w500,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Icon(Icons.arrow_forward, color: Colors.white),
//       SizedBox(width: 5.w),
//     ],
//   ),
// ),

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Fire_Detection.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Humidity.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Light_Intensity.dart';
// import 'package:smartfarm_with_iot_app/home/sensors/Temperature.dart';
// import 'package:smartfarm_with_iot_app/home/tabs/myfileds_tab.dart';
//
// class HomeTab extends StatelessWidget {
//   HomeTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.w),
//           child: Column(
//             children: [
//               Image.asset("assets/images/Weather.png", width: 150.w),
//               SizedBox(height: 10.h),
//               Text(
//                 "24°",
//                 style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 10.h),
//               Text(
//                 "Today is partly sunny day!",
//                 style: GoogleFonts.aBeeZee(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 20.h),
//
//               SizedBox(height: 20.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "My Fields",
//                     style: GoogleFonts.aBeeZee(
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => MyfiledsTab()));
//                     },
//                     child: Text(
//                       "See All",
//                       style: GoogleFonts.aBeeZee(
//                         fontSize: 15.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF7BBC5C),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 180.h,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Fildcard(title: 'Tomatoes', acres: '8 Acre'),
//                     Fildcard(title: 'Lettuce', acres: '2 Acre'),
//                     Fildcard(title: 'Rice', acres: '3 Acre'),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Statistics & Instructions",
//                   style: GoogleFonts.aBeeZee(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 12.h),
//               Wrap(
//                 spacing: 15.w,
//                 runSpacing: 15.h,
//                 alignment: WrapAlignment.start,
//                 children: [
//                   Statcard(
//                       label: "Light Intensity",
//                       imagePath: "assets/images/Light Intensity.png",
//                       onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => LightIntensity()))),
//                   Statcard(
//                       label: "Humidity",
//                       imagePath: "assets/images/Humidity.png",
//                       onTap: () => Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Humidity()))),
//                   Statcard(
//                       label: "Fire Detection",
//                       imagePath: "assets/images/Fire Detection.png",
//                       onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => FireDetection()))),
//                   Statcard(
//                       label: "Temperature",
//                       imagePath: "assets/images/Temprature.png",
//                       onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Temperature()))),
//                 ],
//               ),
//               SizedBox(height: 10.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// class Fildcard extends StatelessWidget {
//   final String title;
//   final String acres;
//
//   const Fildcard({super.key, required this.title, required this.acres});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Container(
//             margin: EdgeInsets.only(right: 14, left: 2),
//             height: 100,
//             width: 160,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               image: DecorationImage(
//                 image: AssetImage("assets/images/Fild.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 2,
//         ),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           acres,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class Statcard extends StatelessWidget {
//   final String imagePath;
//   final String label;
//   final VoidCallback? onTap;
//
//   const Statcard(
//       {super.key,
//         required this.imagePath,
//         required this.label,
//         required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 110,
//         width: 90,
//         margin: EdgeInsets.only(right: 10, left: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(10),
//             topLeft: Radius.circular(10),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 5,
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               width: 61,
//               height: 75,
//               fit: BoxFit.contain,
//             ),
//             //  Spacer(flex: 23,),
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.green,
//               ),
//               child: Text(
//                 label,
//                 style: GoogleFonts.aBeeZee(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             //  Spacer(flex: 3,),
//           ],
//         ),
//       ),
//     );
//   }
// }
