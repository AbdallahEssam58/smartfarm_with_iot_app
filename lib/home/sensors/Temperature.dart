// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Temperature extends StatelessWidget {
//   Temperature({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Temperature", // عدلت الغلط الإملائي من Temprature إلى Temperature
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
//               _buildHeader("8°C", "Too Low", Colors.orange, "assets/images/Temprature.png"),
//               SizedBox(height: 12),
//               _buildConditionBox(
//                 title: "If Temperature is Too High (> 35°C)",
//                 signs: [
//                   ". Wilting or drying leaves",
//                   ". Reduced flowering or fruiting",
//                   ". Increased risk of heat stress and sunscald",
//                 ],
//                 actions: [
//                   ["Provide Shade – Use shade nets (30–50%)", "or row covers."],
//                   ["Increase Irrigation – Water early morning", "or late evening to prevent evaporation."],
//                   ["Use Mulching – Retains soil moisture and", "reduces heat stress."],
//                   ["Mist or Spray Water – Cooling effect for", "leaves and surrounding air."],
//                   ["Improve Air Circulation – Use fans in", "greenhouses or space plants properly."]
//                 ],
//                 bgColor: Color(0xFFFFE2E2),
//               ),
//               SizedBox(height: 12),
//               _buildConditionBox(
//                 title: "If Temperature is Too Low (< 10°C)",
//                 signs: [
//                   ". Slow growth or dormancy",
//                   ". Frost damage (blackened or wilted leaves)",
//                   ". Poor germination and fruit set",
//                 ],
//                 actions: [
//                   ["Cover Crops – Use row covers, plastic", "tunnels, or greenhouses."],
//                   ["Use Reflective Surfaces – White plastic sheets", "or mirrors can redirect more light."]
//                 ],
//                 bgColor: Color(0xFFFFFBE4),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(String value, String status, Color statusColor, String imagePath) {
//     return Container(
//       height: 50,
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: Color(0xFFFFFBE4),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(imagePath, width: 35, height: 35),
//               SizedBox(width: 10),
//               Text(
//                 value,
//                 style: GoogleFonts.inder(
//                   fontSize: 16,
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
//   Widget _buildConditionBox({
//     required String title,
//     required List<String> signs,
//     required List<List<String>> actions,
//     required Color bgColor,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: GoogleFonts.inder(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black)),
//           SizedBox(height: 8),
//           Text("Signs:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           ...signs.map((sign) => Text(sign,
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black))),
//           SizedBox(height: 8),
//           Text("Immediate Actions:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           ...actions.map((pair) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.check_box_sharp, color: Colors.green),
//                   SizedBox(width: 6),
//                   Expanded(
//                     child: Text(pair[0],
//                         style: GoogleFonts.inder(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black)),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 28.0),
//                 child: Text(pair[1],
//                     style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black)),
//               ),
//               SizedBox(height: 6),
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }

//==================================================================//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../mqtt_service.dart';
//
//
// class Temperature extends StatefulWidget {
//   const Temperature({super.key});
//
//   @override
//   State<Temperature> createState() => _TemperatureState();
// }
//
// class _TemperatureState extends State<Temperature> {
//   String tempValue = '--';
//   String tempStatus = '--';
//
//   @override
//   void initState() {
//     super.initState();
//
//
//     MQTTService().setOnMessage((data) {
//       if (data['sensor'] == 'temperature') {
//         setState(() {
//           tempValue = "${data['value']}°C";
//           tempStatus = data['status'];
//         });
//       }
//     });
//   }
//
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'too high':
//         return Colors.red;
//       case 'too low':
//         return Colors.orange;
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
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Temperature",
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
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildHeader(
//                 tempValue,
//                 tempStatus,
//                 getStatusColor(tempStatus),
//                 "assets/images/Temprature.png",
//               ),
//               const SizedBox(height: 12),
//
//
//               if (tempStatus.toLowerCase() == 'too high') ...[
//                 _buildConditionBox(
//                   title: "If Temperature is Too High (> 35°C)",
//                   signs: [
//                     ". Wilting or drying leaves",
//                     ". Reduced flowering or fruiting",
//                     ". Increased risk of heat stress and sunscald",
//                   ],
//                   actions: [
//                     ["Provide Shade", "Use shade nets (30–50%) or row covers."],
//                     ["Increase Irrigation", "Water early morning or late evening."],
//                     ["Use Mulching", "Retains soil moisture and reduces heat stress."],
//                     ["Mist or Spray", "Cools leaves and surrounding air."],
//                     ["Improve Air Circulation", "Use fans or space plants properly."],
//                   ],
//                   bgColor: Color(0xFFFFE2E2),
//                 ),
//               ] else if (tempStatus.toLowerCase() == 'too low') ...[
//                 _buildConditionBox(
//                   title: "If Temperature is Too Low (< 10°C)",
//                   signs: [
//                     ". Slow growth or dormancy",
//                     ". Frost damage (blackened or wilted leaves)",
//                     ". Poor germination and fruit set",
//                   ],
//                   actions: [
//                     ["Cover Crops", "Use row covers, plastic tunnels, or greenhouses."],
//                     ["Reflective Surfaces", "Use white plastic sheets to redirect light."],
//                   ],
//                   bgColor: Color(0xFFFFFBE4),
//                 ),
//               ]
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(String value, String status, Color statusColor, String imagePath) {
//     return Container(
//       height: 50,
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFFFBE4),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(imagePath, width: 35, height: 35),
//               const SizedBox(width: 10),
//               Text(
//                 value,
//                 style: GoogleFonts.inder(
//                   fontSize: 16,
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
//
//   Widget _buildConditionBox({
//     required String title,
//     required List<String> signs,
//     required List<List<String>> actions,
//     required Color bgColor,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: GoogleFonts.inder(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black)),
//           const SizedBox(height: 10),
//           Text("Signs:",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//           const SizedBox(height: 6),
//           ...signs.map((sign) => Padding(
//             padding: const EdgeInsets.only(left: 8, bottom: 4),
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
//             padding: const EdgeInsets.only(bottom: 8),
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
// }
//================================================================//



////=================================================================////
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../mqtt_service.dart';
//
//
// class Temperature extends StatefulWidget {
//   const Temperature({super.key});
//
//   @override
//   State<Temperature> createState() => _TemperaturePageState();
// }
//
// class _TemperaturePageState extends State<Temperature> {
//   String tempValue = '--';
//   String tempStatus = '--';
//   List<String> adviceList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     MQTTService().setOnMessage((data) async {
//       if (data['sensor'] == 'temperature') {
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Temperature", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeader("assets/images/Temprature.png", tempValue, tempStatus),
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
//         color: const Color(0xFFFFFBE4),
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
////==================================================================////
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../mqtt_service.dart';
//
// class Temperature extends StatefulWidget {
//   const Temperature({super.key});
//
//   @override
//   State<Temperature> createState() => _TemperaturePageState();
// }
//
// class _TemperaturePageState extends State<Temperature> {
//   String tempValue = '--';
//   String tempStatus = '--';
//   List<String> adviceList = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     MQTTService().setOnMessage((data) async {
//       if (data.containsKey("Temperature")) {
//         final temp = data["Temperature"];
//         final value = temp["value"] ?? 0.0;
//         final status = temp["status"] ?? "Unknown";
//
//         setState(() {
//           tempValue = "$value°C";
//           tempStatus = status;
//         });
//
//         final doc = await FirebaseFirestore.instance
//             .collection("instructions")
//             .doc(tempStatus)
//             .get();
//
//         setState(() {
//           adviceList = List<String>.from(doc.data()?['messages'] ?? []);
//         });
//       }
//     });
//   }
//
//   Color getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case '❌ critical':
//         return Colors.red;
//       case '⚠️ warning':
//         return Colors.orange;
//       case '✅ optimal':
//       case 'good':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Temperature", style: GoogleFonts.inder(color: Colors.black)),
//         backgroundColor: Colors.white,
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildHeader("assets/images/Temprature.png", tempValue, tempStatus),
//             const SizedBox(height: 16),
//             _buildAdviceList(),
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
//         color: const Color(0xFFFFFBE4),
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(image, width: 35),
//               const SizedBox(width: 10),
//               Text(
//                 value,
//                 style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             status,
//             style: GoogleFonts.inder(
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//               color: getStatusColor(status),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAdviceList() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Recommendations:",
//           style: GoogleFonts.inder(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),
//         ...adviceList.map((advice) => Padding(
//           padding: const EdgeInsets.only(bottom: 6),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Icon(Icons.check_circle, color: Colors.green),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   advice,
//                   style: GoogleFonts.inder(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ],
//     );
//   }
//
// =====================================================================================////
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../firebase_functions.dart';
import '../../mqtt_service.dart';


class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<Temperature> {
  String tempValue = '--';
  String tempStatus = '--';
  String advice = '';
  List<String> adviceList = [];

  @override
  void initState() {
    super.initState();
    MQTTService().subscribe("sensors/data");

    MQTTService().setOnMessage((data) async {
      final value = data["Temperature"] ?? 0.0;
      final status = data["temp_status"] ?? "Unknown";

      setState(() {
        tempValue = "$value°C";
        tempStatus = status;
      });

      final instruction = await FirebaseFunctions.getInstructions(status);
      setState(() {
        advice = instruction['recommendation'] ?? '';
        adviceList = List<String>.from(instruction['messages'] ?? []);
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
        title: Text("Temperature", style: GoogleFonts.inder(color: Colors.black)),
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
              _buildHeader(tempValue, tempStatus),
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
        color: const Color(0xFFFFFBE4),
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
    if (advice.isEmpty) return const SizedBox();
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
            advice,
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
// class Temperature extends StatelessWidget{
//   Temperature({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Temprature",
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
//                 color: Color(0xFFFFFBE4),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "assets/images/Temprature.png",
//                     width: 45,
//                     height: 50,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "8°C ",
//                     style: GoogleFonts.inder(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 220,
//                   ),
//                   Text(
//                     "Too Low",
//                     style: GoogleFonts.inder(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFF59D38),
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
//             height: 410,
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
//                         text: "If Temperature is",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextSpan(
//                           text: "Too High (> 35°C)",
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
//                   ". Wilting or drying leaves",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Reduced flowering or fruiting",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Increased risk of heat stress and sunscald",
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
//                       "Provide Shade – Use shade nets (30–50%)",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "or row covers.",
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
//                       "Increase Irrigation – Water early morning",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "or late evening to prevent evaporation.",
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
//                       "Use Mulching – Retains soil moisture and",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   " reduces heat stress.",
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
//                       " Mist or Spray Water – Cooling effect for",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "leaves and surrounding air.",
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
//                       "Improve Air Circulation – Use fans in",
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
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 8,
//           ),
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
//                         text: "If Temperature is ",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextSpan(
//                           text: "Too Low (< 10°C)",
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
//                   ". Slow growth or dormancy",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Frost damage (blackened or wilted leaves)",
//                   style: GoogleFonts.inder(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 1,),
//                 Text(
//                   ". Poor germination and fruit set",
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
//                       "Cover Crops – Use row covers, plastic",
//                       style: GoogleFonts.inder(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "tunnels, or greenhouses.",
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