// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Humidity extends StatelessWidget {
//   Humidity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Humidity",
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
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildHumidityHeader("90% RH", "Too High", Color(0xFFFF0000), "assets/images/Humidity.png", Color(0xFFFFE2E2)),
//               SizedBox(height: 12),
//               _buildHumidityContainer(
//                 context,
//                 backgroundColor: Color(0xFFFFE2E2),
//                 title: "If Humidity is Too High (> 85% RH)",
//                 signs: [
//                   ". Increased risk of fungal diseases (powdery mildew, mold, rot)",
//                   ". Poor pollination and fruit set",
//                   ". Weak or slow growth due to lack of transpiration"
//                 ],
//                 actions: [
//                   ["Increase Air Circulation – Use fans in", "greenhouses or space plants properly."],
//                   ["Improve Drainage – Prevent water", "stagnation by ensuring proper soil drainage."],
//                   ["Reduce Overwatering – Water early in the", "morning to allow drying throughout the day."],
//                   ["Apply Organic Mulch Sparingly – Excess", "mulch can trap moisture and promote mold growth."]
//                 ],
//               ),
//               SizedBox(height: 12),
//               _buildHumidityContainer(
//                 context,
//                 backgroundColor: Color(0xFFFFFBE4),
//                 title: "If Humidity is Too Low (< 40% RH)",
//                 signs: [
//                   ". Dry, curled, or brittle leaves",
//                   ". Increased water loss and wilting",
//                   ". Stunted growth or reduced yield"
//                 ],
//                 actions: [
//                   ["Increase Irrigation – Use drip irrigation", "to keep soil moist and consistent."],
//                   ["Use Reflective Surfaces – White plastic sheets", "or mirrors can redirect more light."],
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHumidityHeader(String value, String status, Color statusColor, String iconPath, Color bgColor) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(iconPath, width: 35, height: 35),
//               SizedBox(width: 10),
//               Text(
//                 value,
//                 style: GoogleFonts.inder(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             status,
//             style: GoogleFonts.inder(
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//               color: statusColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHumidityContainer(
//       BuildContext context, {
//         required Color backgroundColor,
//         required String title,
//         required List<String> signs,
//         required List<List<String>> actions,
//       }) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.inder(
//               fontSize: 17,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(height: 8),
//           Text("Signs:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           ...signs
//               .map((sign) => Text(
//             sign,
//             style: GoogleFonts.inder(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Colors.black,
//             ),
//           ))
//               .toList(),
//           SizedBox(height: 8),
//           Text("Immediate Actions:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           SizedBox(height: 4),
//           ...actions.map((pair) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.check_box_sharp, color: Colors.green),
//                   SizedBox(width: 4),
//                   Expanded(
//                     child: Text(
//                       pair[0],
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 28),
//                 child: Text(
//                   pair[1],
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 4),
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
//=================================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../mqtt_service.dart';
//
//
// class Humidity extends StatefulWidget {
//   const Humidity({super.key});
//
//   @override
//   State<Humidity> createState() => _HumidityPageState();
// }
//
// class _HumidityPageState extends State<Humidity> {
//   String humidityValue = '--';
//   String humidityStatus = '--';
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     MQTTService().setOnMessage((data) {
//       if (data['sensor'] == 'humidity') {
//         setState(() {
//           humidityValue = "${data['value']}%";
//           humidityStatus = data['status'];
//         });
//       }
//     });
//   }
//
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'too low':
//         return Colors.orange;
//       case 'too high':
//         return Colors.red;
//       case 'suitable':
//       case 'good':
//         return const Color(0xFF1EB624);
//       default:
//         return Colors.grey;
//     }
//   }
//
//   Widget buildHumidityContainer({
//     required Color backgroundColor,
//     required String title,
//     required List<String> signs,
//     required List<List<String>> actions,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.inder(
//               fontSize: 17,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text("Signs:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           const SizedBox(height: 6),
//           ...signs.map((sign) => Padding(
//             padding: const EdgeInsets.only(left: 8.0, bottom: 4),
//             child: Row(
//               children: [
//                 const Icon(Icons.brightness_1, size: 8, color: Colors.black54),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     sign,
//                     style: GoogleFonts.inder(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           const SizedBox(height: 10),
//           Text("Immediate Actions:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           const SizedBox(height: 6),
//           ...actions.map((pair) => Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const Icon(Icons.check_circle, color: Colors.green),
//                     const SizedBox(width: 6),
//                     Expanded(
//                       child: Text(
//                         pair[0],
//                         style: GoogleFonts.inder(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 28.0, top: 2),
//                   child: Text(
//                     pair[1],
//                     style: GoogleFonts.inder(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Humidity", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE0F7FA),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset("assets/images/Humidity.png", width: 30),
//                       const SizedBox(width: 10),
//                       Text(
//                         humidityValue,
//                         style: GoogleFonts.inder(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     humidityStatus,
//                     style: GoogleFonts.inder(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: getStatusColor(humidityStatus),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//
//
//             if (humidityStatus.toLowerCase() == 'too low') ...[
//               buildHumidityContainer(
//                 backgroundColor: const Color(0xFFFFF3E0),
//                 title: "If Humidity is Too Low (< 30%)",
//                 signs: [
//                   "Leaves appear dry and crispy",
//                   "Soil dries quickly",
//                   "Wilting during midday",
//                 ],
//                 actions: [
//                   ["Increase Irrigation", "Water more frequently but avoid overwatering."],
//                   ["Use Mulch", "To retain soil moisture."],
//                   ["Mist Plants", "Helps raise local humidity."],
//                 ],
//               )
//             ] else if (humidityStatus.toLowerCase() == 'too high') ...[
//               buildHumidityContainer(
//                 backgroundColor: const Color(0xFFFFEBEE),
//                 title: "If Humidity is Too High (> 80%)",
//                 signs: [
//                   "Leaf yellowing or mold",
//                   "Fungal growth on stems or soil",
//                 ],
//                 actions: [
//                   ["Improve Air Flow", "Use fans or ventilate the area."],
//                   ["Avoid Overwatering", "Ensure proper drainage."],
//                   ["Thin Crowded Plants", "To improve space and air movement."],
//                 ],
//               )
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
//=================================================================//
////==============================================================////
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../mqtt_service.dart';
//
//
// class Humidity extends StatefulWidget {
//   const Humidity({super.key});
//
//   @override
//   State<Humidity> createState() => _HumidityPageState();
// }
//
// class _HumidityPageState extends State<Humidity> {
//   String tempValue = '--';
//   String tempStatus = '--';
//   List<String> adviceList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     MQTTService().setOnMessage((data) async {
//       if (data['sensor'] == 'Humidity') {
//         setState(() {
//           tempValue = "${data['value']}°C";
//           tempStatus = data['status'];
//         });
//         final doc = await FirebaseFirestore.instance
//             .collection("instructions")
//             .doc(tempStatus)
//             .get();
//         setState(() {
//           adviceList = List<String>.from(doc.data()?['messages'] ?? []);
//         });
//       }
//     });
//   }
//
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'too hot':
//         return Colors.red;
//       case 'too low':
//         return Colors.orange;
//       case 'suitable':
//       case 'good':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Humidity", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeader("assets/images/Humidity.png", tempValue, tempStatus),
//             const SizedBox(height: 16),
//             _buildAdviceList()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(String image, String value, String status) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFE2E2),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(image, width: 35),
//               const SizedBox(width: 10),
//               Text(value, style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
//             ],
//           ),
//           Text(status,
//               style: GoogleFonts.inder(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: getStatusColor(status))),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAdviceList() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Recommendations:",
//             style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 8),
//         ...adviceList.map((advice) => Padding(
//           padding: const EdgeInsets.only(bottom: 6),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(Icons.check_circle, color: Colors.green),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(advice,
//                     style: GoogleFonts.inder(fontSize: 14, fontWeight: FontWeight.w500)),
//               ),
//             ],
//           ),
//         ))
//       ],
//     );
//   }
// }
////===========================================================////
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../firebase_functions.dart';
import '../../mqtt_service.dart';


class Humidity extends StatefulWidget {
  const Humidity({super.key});

  @override
  State<Humidity> createState() => _HumidityPageState();
}

class _HumidityPageState extends State<Humidity> {
  String humidityValue = '--';
  String humidityStatus = '--';
  String overallAdvice = '';
  List<String> adviceList = [];

  @override
  void initState() {
    super.initState();

    MQTTService().subscribe("sensors/data");

    MQTTService().setOnMessage((data) async {
      final value = data["Humidity"] ?? 0.0;
      final status = data["hum_status"] ?? "Unknown";

      setState(() {
        humidityValue = "$value %";
        humidityStatus = status;
      });

      final instruction = await FirebaseFunctions.getInstructions(status);

      setState(() {
        overallAdvice = instruction["recommendation"] ?? '';
        adviceList = List<String>.from(instruction["messages"] ?? []);
      });
    });
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'bad':
        return Colors.red;
      case 'good':
        return Colors.green;
      case 'warning':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Humidity", style: GoogleFonts.inder(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(humidityValue, humidityStatus),
              const SizedBox(height: 16),
              _buildAdviceList(),
              _buildOverallAdvice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String value, String status) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE4F2FF),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value,
              style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(status,
              style: GoogleFonts.inder(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: getStatusColor(status),
              )),
        ],
      ),
    );
  }

  Widget _buildAdviceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Detailed Recommendations:",
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
                    style: GoogleFonts.inder(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget _buildOverallAdvice() {
    if (overallAdvice.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text("Overall Recommendation:",
            style: GoogleFonts.inder(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.yellow[100], borderRadius: BorderRadius.circular(12)),
          child: Text(
            overallAdvice,
            style: GoogleFonts.inder(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Humidity extends StatelessWidget{
//   Humidity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Humidity",
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
//                 color: Color(0xFFFFE2E2),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "assets/images/Humidity.png",
//                     width: 35,
//                     height: 50,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     "90% RH",
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
//                     "Too High",
//                     style: GoogleFonts.inder(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFFF0000),
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
//                 Text(
//                   "If Humidity is Too High (> 85% RH)",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
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
//                   ". Increased risk of fungal diseases(powdery mildew,mold, rot)",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Poor pollination and fruit set",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Weak or slow growth due to lack of transpiration",
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
//                       "Increase Air Circulation – Use fans in",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "greenhouses or space plants properly.",
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
//                       "Improve Drainage – Prevent water",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "stagnation by ensuring proper soil drainage.",
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
//                       "Reduce Overwatering – Water early in the ",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "morning to allow drying throughout the day.",
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
//                       "Apply Organic Mulch Sparingly – Excess",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "mulch can trap moisture and promote mold growth.",
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
//           ),
//           Container(
//               height: 270,
//               width: 395,
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFFBE4),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child:  Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       style: GoogleFonts.inder(
//                         fontSize: 17,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: "If Humidity is",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         TextSpan(
//                             text: "Too Low (< 40% RH)",
//                             style: TextStyle(
//                               color: Colors.orange,
//                               fontWeight: FontWeight.w500,
//                             )),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 1,),
//                   Text(
//                     "Signs:",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 1,),
//                   Text(
//                     ". Dry, curled, or brittle leaves",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 1,),
//                   Text(
//                     ". Increased water loss and wilting",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 1,),
//                   Text(
//                     ". Stunted growth or reduced yield",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 3,),
//                   Text(
//                     "Immediate Actions:",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 4,),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.check_box_sharp,
//                         color: Colors.green,
//                       ),
//                       SizedBox(
//                         width: 4,
//                       ),
//                       Text(
//                         "Increase Irrigation – Use drip irrigation",
//                         style: GoogleFonts.inder(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     "Remove obstructions blocking sunlight.",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 1,),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.check_box_sharp,
//                         color: Colors.green,
//                       ),
//                       SizedBox(
//                         width: 4,
//                       ),
//                       Text(
//                         " Use Reflective Surfaces – White plastic sheets",
//                         style: GoogleFonts.inder(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     "or mirrors can redirect more light.",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }