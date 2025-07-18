// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class FireDetection extends StatelessWidget {
//   FireDetection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "Fire Detection",
//           style: GoogleFonts.inder(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 "When there is a fire detected, the alarm is going to ring automatically.",
//                 style: GoogleFonts.inder(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               SizedBox(height: 50),
//               Center(
//                 child: Image.asset(
//                   "assets/images/Fire Detection.png",
//                   width: 170,
//                   height: 170,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 height: 440,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF6F6F6),
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Fire Instructions",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Divider(
//                         color: Color(0xFFD6D6D6),
//                         thickness: 3,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "1.  Stay Calm",
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             ". Do not panic. Quick, calm actions are essential for \n  safety.",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "2. Do Not Use Water on Electrical Fires",
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             ". If the fire is electrical, using water can be dangerous.\n  Use a fire extinguisher rated for electrical fires\n  (Class C) or a dry sand bucket.",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "3. Close Doors",
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             ". If the fire is electrical, using water can be dangerous.\n  Use a fire extinguisher rated for electrical fires\n  (Class C) or a dry sand bucket.",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "4. Use Fire Extinguishers if Safe",
//                             style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             ".  Only use a fire extinguisher if the fire is small and\n   you know how to operate it safely. Aim at the base\n   of the fire. ",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//=============================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../mqtt_service.dart';
//
//
// class FireDetection extends StatefulWidget {
//   const FireDetection({super.key});
//
//   @override
//   State<FireDetection> createState() => _FirePageState();
// }
//
// class _FirePageState extends State<FireDetection> {
//   bool fireDetected = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     MQTTService().setOnMessage((data) {
//       if (data['sensor'] == 'fire' && data['status'] == 'Detected') {
//         setState(() {
//           fireDetected = true;
//         });
//       }
//     });
//   }
//
//   Widget buildAction(String title, String description) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.inder(
//             color: Colors.green,
//             fontSize: 15,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           description,
//           style: GoogleFonts.inder(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Fire Emergency", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: fireDetected
//               ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "🔥 Fire Detected!",
//                 style: GoogleFonts.inder(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               ),
//               const SizedBox(height: 16),
//
//               buildAction("1. Alert Nearby People", "Immediately notify everyone around you."),
//               buildAction(
//                 "2. Turn Off Power",
//                 "If the fire is electrical, using water can be dangerous.\n"
//                     "Use a fire extinguisher rated for electrical fires (Class C)\n"
//                     "or a dry sand bucket.",
//               ),
//               buildAction("3. Close Doors", "To contain the fire and reduce oxygen flow."),
//               buildAction(
//                 "4. Use Fire Extinguishers if Safe",
//                 "Only use a fire extinguisher if the fire is small\n"
//                     "and you know how to operate it safely.\n"
//                     "Aim at the base of the fire.",
//               ),
//             ],
//           )
//               : Center(
//             child: Text(
//               "✅ No Fire Detected.",
//               style: GoogleFonts.inder(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//=============================================================//


//========================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../mqtt_service.dart';
//
//
// class FireDetection extends StatefulWidget {
//   const FireDetection({super.key});
//
//   @override
//   State<FireDetection> createState() => _FireDetectionPageState();
// }
//
// class _FireDetectionPageState extends State<FireDetection> {
//   bool fireDetected = false;
//
//   @override
//   void initState() {
//     super.initState();
//     MQTTService().setOnMessage((data) {
//       if (data['sensor'] == 'fire' && data['status'] == 'Detected') {
//         setState(() {
//           fireDetected = true;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Fire Emergency", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: fireDetected
//             ? Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("🔥 Fire Detected!",
//                 style: GoogleFonts.inder(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 16),
//             _buildAdvice("1. Alert People", "Immediately notify everyone nearby."),
//             _buildAdvice("2. Cut Power", "If it's electrical, turn off power before acting."),
//             _buildAdvice("3. Use Extinguisher", "Use Class C fire extinguisher or dry sand."),
//             _buildAdvice("4. Evacuate", "Call emergency services immediately."),
//           ],
//         )
//             : Center(
//           child: Text("✅ No Fire Detected.",
//               style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.w500)),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAdvice(String title, String desc) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: GoogleFonts.inder(fontSize: 15, color: Colors.green, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 4),
//           Text(desc,
//               style: GoogleFonts.inder(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }
// }
//=================================================================//

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../firebase_functions.dart';
// import '../../mqtt_service.dart';
//
//
// class FireDetection extends StatefulWidget {
//   const FireDetection({super.key});
//
//   @override
//   State<FireDetection> createState() => _FireDetectionState();
// }
//
// class _FireDetectionState extends State<FireDetection> {
//   bool fireDetected = false;
//   String fireStatus = 'No Fire';
//   String recommendation = '';
//   List<String> fireActions = [];
//
//   @override
//   void initState() {
//     super.initState();
//     MQTTService().subscribe("sensors/data");
//
//     MQTTService().setOnMessage((data) async {
//       final status = data["fire_status"] ?? "Safe";
//
//       if (status.toLowerCase() == "detected") {
//         setState(() {
//           fireDetected = true;
//           fireStatus = "🔥 Fire Detected!";
//         });
//
//         final instruction = await FirebaseFunctions.getInstructions("Detected");
//
//         setState(() {
//           recommendation = instruction["recommendation"] ?? '';
//           fireActions = List<String>.from(instruction["messages"] ?? []);
//         });
//       } else {
//         setState(() {
//           fireDetected = false;
//           fireStatus = "✅ No Fire Detected";
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Fire Emergency", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildStatusBox(),
//               const SizedBox(height: 16),
//               if (fireDetected) _buildRecommendation(),
//               if (fireDetected) _buildActionSteps(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatusBox() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: fireDetected ? Colors.red[100] : Colors.green[100],
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             fireDetected ? Icons.warning_amber : Icons.check_circle,
//             color: fireDetected ? Colors.red : Colors.green,
//             size: 28,
//           ),
//           const SizedBox(width: 10),
//           Text(
//             fireStatus,
//             style: GoogleFonts.inder(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRecommendation() {
//     if (recommendation.isEmpty) return const SizedBox();
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Recommendation:",
//             style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 8),
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.orange[100],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(
//             recommendation,
//             style: GoogleFonts.inder(fontSize: 14, fontWeight: FontWeight.w500),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionSteps() {
//     if (fireActions.isEmpty) return const SizedBox();
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 20),
//         Text("Fire Safety Actions:",
//             style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 8),
//         ...fireActions.map((action) => Padding(
//           padding: const EdgeInsets.only(bottom: 6),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(Icons.local_fire_department, color: Colors.red),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(action,
//                     style: GoogleFonts.inder(
//                         fontSize: 14, fontWeight: FontWeight.w500)),
//               ),
//             ],
//           ),
//         )),
//       ],
//     );
//   }
// }
//===============================================================//
//===============================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../mqtt_service.dart';
//
// class FireDetection extends StatefulWidget {
//   const FireDetection({super.key});
//
//   @override
//   State<FireDetection> createState() => _FireDetectionState();
// }
//
// class _FireDetectionState extends State<FireDetection> {
//   bool fireDetected = false;
//
//   @override
//   void initState() {
//     super.initState();
//     MQTTService().setOnMessage((data) {
//       if (data['sensor'] == 'fire') {
//         setState(() {
//           fireDetected = data['value'] == true;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Fire Detection", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: fireDetected
//             ? Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.red[100],
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Row(
//             children: [
//               Icon(Icons.warning, color: Colors.red, size: 32),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text("🔥 Fire Detected! Take Immediate Action!",
//                     style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.red[900])),
//               )
//             ],
//           ),
//         )
//             : Center(
//           child: Text("✅ No Fire Detected",
//               style: GoogleFonts.inder(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green)),
//         ),
//       ),
//     );
//   }
// }
//===================================================================//
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../mqtt_service.dart';

class FireDetection extends StatefulWidget {
  const FireDetection({super.key});

  @override
  State<FireDetection> createState() => _FireDetectionState();
}

class _FireDetectionState extends State<FireDetection> {
  bool fireDetected = false;

  @override
  void initState() {
    super.initState();

    // ✅ الاشتراك في التوبك
    MQTTService().subscribe("sensors/data");

    // ✅ الاستماع للرسائل
    MQTTService().setOnMessage((data) {
      if (data.containsKey("fire")) {
        final value = data["fire"];
        if (value is bool) {
          setState(() {
            fireDetected = value;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fire Detection", style: GoogleFonts.inder(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: fireDetected
            ? Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              const Icon(Icons.warning, color: Colors.red, size: 32),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "🔥 Fire Detected! Take Immediate Action!",
                  style: GoogleFonts.inder(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900],
                  ),
                ),
              )
            ],
          ),
        )
            : Center(
          child: Text(
            "✅ No Fire Detected",
            style: GoogleFonts.inder(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}


//====================================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class FireDetection extends StatelessWidget {
//   FireDetection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Fire Detection",
//           style: GoogleFonts.inder(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "When there is a fire detected, the alarm is going to\n ring automatically.",
//                   style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey,
//                   ),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: 50,),
//           Image.asset(
//             "assets/images/Fire Detection.png",
//             width: 170,
//             height: 170,
//             fit: BoxFit.contain,
//           ),
//           SizedBox(height: 10,),
//           Container(
//             height: 440,
//             width: 390,
//             decoration: BoxDecoration(
//               color: Color(0xFFF6F6F6),
//               borderRadius: BorderRadius.circular(25),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
////=======================================================================================///
