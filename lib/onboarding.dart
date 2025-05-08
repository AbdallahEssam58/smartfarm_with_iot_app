import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartfarm_with_iot_app/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'create_an_account.dart';


class OnboardingScreen extends StatefulWidget {
  static const String routeName = "Onboarding";

  OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //final CarouselController _carouselController = CarouselController();
  int _current = 0; // To track the current page index

  //List of slides with image and text
  final List<Map<String, String>> slides = [
    {
      'image': 'assets/images/greenhouse.png',
      'title': 'Optimize water usage\n and reduce waste\n through smart irrigation.',
      'subtitle': 'Embrace Sustainable Practices to Conserve\n Resources and Improve Farm Efficiency.'
    },
    {
      'image': 'assets/images/Farming.png',
      'title': 'Get instant alerts on soil\n health and weather\n conditions.',
      'subtitle': 'Stay Informed with Timely Notifications to\n Safeguard Your Crops and Enhance Yield.'
    },
    {
      'image': 'assets/images/Sprinklins.png',
      'title': 'Monitor your crops in\n real-time with AI-driven\n insights.',
      'subtitle': 'Leverage Advanced Technology to Enhance\n Decision-Making and Boost Crop Productivity.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CarouselSlider(
              items: slides
                  .map((slide) => Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      slide['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    slide['title']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inder(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    slide['subtitle']!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inder(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0D1814)),
                  ),
                ],
              ))
                  .toList(),
              // carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: AnimatedSmoothIndicator(
              activeIndex: _current,
              count: slides.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.green,
                dotColor: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateAnAccountScreen()),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "Create an Account",
                style: GoogleFonts.inder(
                    fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),

          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SignIn()),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                "Log In",
                style: GoogleFonts.inder(
                    fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






























































// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   static const String routeName = "Onboarding";
//
//   OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Image.asset(
//             "images/assets/greenhouse.png",
//             fit: BoxFit.cover,
//             width: double.infinity,
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             "Optimize water usage\n and reduce waste\n through smart irrigation.",
//             style: GoogleFonts.inder(
//                 fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             textAlign: TextAlign.center,
//             "Embrace Sustainable Practices to Conserve\n Resources and Improve Farm Efficiency.",
//             style: GoogleFonts.inder(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w400,
//                 color: Color(0xFF0D1814)),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               child: Text(
//                 "Create an Account",
//                 style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               child: Text(
//                 "Log In",
//                 style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
