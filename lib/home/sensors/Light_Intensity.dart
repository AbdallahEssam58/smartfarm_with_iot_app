// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LightIntensity extends StatelessWidget {
//   const LightIntensity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Light Intensity",
//           style: GoogleFonts.inder(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Container(
//                 height: 50,
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFC0F0C2),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           "assets/images/sun.png",
//                           width: 35,
//                           height: 35,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           "55.000 LUX",
//                           style: GoogleFonts.inder(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "Good",
//                       style: GoogleFonts.inder(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF1EB624),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 12),
//
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFFE2E2),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         style: GoogleFonts.inder(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                         children: [
//                           TextSpan(text: "If Light Intensity is "),
//                           TextSpan(
//                             text: "Too High (> 70,000 LUX)",
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     _buildSectionTitle("Signs:"),
//                     _buildBulletPoint(". Leaf scorching or wilting"),
//                     _buildBulletPoint(". Yellow or brown spots on leaves"),
//                     _buildBulletPoint(". Dry or brittle leaves"),
//                     SizedBox(height: 6),
//                     _buildSectionTitle("Immediate Actions:"),
//                     _buildCheckItem(
//                         "Provide Shade – Use shade nets (30–50%", "shading) or temporary coverings."),
//                     _buildCheckItem(
//                         "Increase Irrigation – More sunlight leads", "to higher evaporation; adjust water supply accordingly."),
//                     _buildCheckItem(
//                         "Use Reflective Mulches – Light-colored or", "reflective mulches can reduce excess heat stress."),
//                     _buildCheckItem(
//                         "Mist or Spray Water – Light misting can", "can cool down plants and reduce leaf temperature."),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 12),
//
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFFFFBE4),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         style: GoogleFonts.inder(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                         children: [
//                           TextSpan(text: "If Light Intensity is "),
//                           TextSpan(
//                             text: "Too Low (< 20,000 LUX)",
//                             style: TextStyle(
//                               color: Colors.orange,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     _buildSectionTitle("Signs:"),
//                     _buildBulletPoint(
//                         ". Slow growth or leggy (tall, weak) plants"),
//                     _buildBulletPoint(". Yellowing leaves"),
//                     _buildBulletPoint(". Poor flowering or fruit production"),
//                     SizedBox(height: 6),
//                     _buildSectionTitle("Immediate Actions:"),
//                     _buildCheckItem(
//                         "Prune Surrounding Trees or Structures –", "Remove obstructions blocking sunlight."),
//                     _buildCheckItem(
//                         "Use Reflective Surfaces – White plastic sheets", "or mirrors can redirect more light."),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: GoogleFonts.inder(
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//         color: Colors.black,
//       ),
//     );
//   }
//
//   Widget _buildBulletPoint(String text) {
//     return Text(
//       text,
//       style: GoogleFonts.inder(
//         fontSize: 16,
//         fontWeight: FontWeight.w500,
//         color: Colors.black,
//       ),
//     );
//   }
//
//   Widget _buildCheckItem(String line1, String line2) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(Icons.check_box_sharp, color: Colors.green),
//             SizedBox(width: 4),
//             Expanded(
//               child: Text(
//                 line1,
//                 style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 28),
//           child: Text(
//             line2,
//             style: GoogleFonts.inder(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         SizedBox(height: 4),
//       ],
//     );
//   }
// }
//=====================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/mqtt_service.dart';
//
//
// class LightIntensity extends StatefulWidget {
//   const LightIntensity({super.key});
//
//   @override
//   State<LightIntensity> createState() => _LightIntensityState();
// }
//
// class _LightIntensityState extends State<LightIntensity> {
//   String lightValue = '--';
//   String lightStatus = '--';
//
//   @override
//   void initState() {
//     super.initState();
//
//
//    MQTTService().setOnMessage((data) {
//       if (data['sensor'] == 'light') {
//         setState(() {
//           lightValue = data['value'].toString();
//           lightStatus = data['status'];
//         });
//       }
//     });
//   }
//
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'too dark':
//         return Colors.orange;
//       case 'too bright':
//         return Colors.red;
//       case 'suitable':
//       case 'good':
//         return Color(0xFF1EB624);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Light Intensity",
//           style: GoogleFonts.inder(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Container(
//                 height: 50,
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFC0F0C2),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           "assets/images/sun.png",
//                           width: 35,
//                           height: 35,
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           "$lightValue LUX",
//                           style: GoogleFonts.inder(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       lightStatus,
//                       style: GoogleFonts.inder(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: getStatusColor(lightStatus),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//===============================================================//


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../mqtt_service.dart';


class LightIntensity extends StatefulWidget {
  const LightIntensity({super.key});

  @override
  State<LightIntensity> createState() => _LightIntensityPageState();
}

class _LightIntensityPageState extends State<LightIntensity> {
  String tempValue = '--';
  String tempStatus = '--';
  List<String> adviceList = [];

  @override
  void initState() {
    super.initState();
    MQTTService().setOnMessage((data) async {
      if (data['sensor'] == 'LightIntensity') {
        setState(() {
          tempValue = "${data['value']}°C";
          tempStatus = data['status'];
        });
        final doc = await FirebaseFirestore.instance
            .collection("instructions")
            .doc(tempStatus)
            .get();
        setState(() {
          adviceList = List<String>.from(doc.data()?['messages'] ?? []);
        });
      }
    });
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'too hot':
        return Colors.red;
      case 'too low':
        return Colors.orange;
      case 'suitable':
      case 'good':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LightIntensity", style: GoogleFonts.inder(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader("assets/images/Light Intensity.png", tempValue, tempStatus),
            const SizedBox(height: 16),
            _buildAdviceList()
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String image, String value, String status) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFC0F0C2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(image, width: 35),
              const SizedBox(width: 10),
              Text(value, style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(status,
              style: GoogleFonts.inder(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: getStatusColor(status))),
        ],
      ),
    );
  }

  Widget _buildAdviceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommendations:",
            style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...adviceList.map((advice) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: Text(advice,
                    style: GoogleFonts.inder(fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ))
      ],
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LightIntensity extends StatelessWidget {
//   LightIntensity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Light Intensity",
//           style: GoogleFonts.inder(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 32,
//               width: 400,
//               decoration: BoxDecoration(
//                 color: Color(0xFFC0F0C2),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "assets/images/sun.png",
//                     width: 35,
//                     height: 50,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     "55.000 LUX",
//                     style: GoogleFonts.inder(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 200,
//                   ),
//                   Text(
//                     "Good",
//                     style: GoogleFonts.inder(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1EB624),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Container(
//             height: 430,
//             width: 395,
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Color(0xFFFFE2E2),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: GoogleFonts.inder(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "If Light Intensity is",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextSpan(
//                           text: "Too High (> 70,000 LUX)",
//                           style: TextStyle(
//                             color: Colors.red,
//                             fontWeight: FontWeight.w500,
//                           )),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   "Signs:",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Leaf scorching or wilting",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Yellow or brown spots on leaves",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Dry or brittle leaves",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 3,),
//                 Text(
//                   "Immediate Actions:",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 4,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_box_sharp,
//                       color: Colors.green,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "Provide Shade – Use shade nets (30–50%",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "shading) or temporary coverings.",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_box_sharp,
//                       color: Colors.green,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "Increase Irrigation – More sunlight leads ",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "to higher evaporation; adjust water supply accordingly.",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_box_sharp,
//                       color: Colors.green,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "Use Reflective Mulches – Light-colored or ",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "reflective mulches can reduce excess heat stress.",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_box_sharp,
//                       color: Colors.green,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       "Mist or Spray Water – Light misting can",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "can cool down plants and reduce leaf temperature.",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 8,
//             ),
//           Container(
//             height: 270,
//             width: 395,
//             decoration: BoxDecoration(
//               color: Color(0xFFFFFBE4),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child:  Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     style: GoogleFonts.inder(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "If Light Intensity is ",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextSpan(
//                           text: "Too Low (< 20,000 LUX)",
//                           style: TextStyle(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.w500,
//                           )),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   "Signs:",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Slow growth or leggy (tall, weak) plants",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Yellowing leaves",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Poor flowering or fruit production",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 3,),
//                 Text(
//                   "Immediate Actions:",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 4,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_box_sharp,
//                       color: Colors.green,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       " Prune Surrounding Trees or Structures – ",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "Remove obstructions blocking sunlight.",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.check_box_sharp,
//                       color: Colors.green,
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                       " Use Reflective Surfaces – White plastic sheets",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "or mirrors can redirect more light.",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
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