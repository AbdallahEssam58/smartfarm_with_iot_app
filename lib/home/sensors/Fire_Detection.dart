import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FireDetection extends StatelessWidget {
  FireDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Fire Detection",
          style: GoogleFonts.inder(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "When there is a fire detected, the alarm is going to ring automatically.",
                style: GoogleFonts.inder(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Image.asset(
                  "assets/images/Fire Detection.png",
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 440,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Fire Instructions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xFFD6D6D6),
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "1.  Stay Calm",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ". Do not panic. Quick, calm actions are essential for \n  safety.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "2. Do Not Use Water on Electrical Fires",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ". If the fire is electrical, using water can be dangerous.\n  Use a fire extinguisher rated for electrical fires\n  (Class C) or a dry sand bucket.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "3. Close Doors",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ". If the fire is electrical, using water can be dangerous.\n  Use a fire extinguisher rated for electrical fires\n  (Class C) or a dry sand bucket.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "4. Use Fire Extinguishers if Safe",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ".  Only use a fire extinguisher if the fire is small and\n   you know how to operate it safely. Aim at the base\n   of the fire. ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
