import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartfarm_with_iot_app/home/home_screen.dart';

import 'firebase_functions.dart';
import 'models/farm_model.dart';

class SetUpFarmScreen extends StatefulWidget {
  static const String routeName = "SetUpFarmScreen";

  @override
  State<SetUpFarmScreen> createState() => _SetUpFarmScreenState();
}

class _SetUpFarmScreenState extends State<SetUpFarmScreen> {
  @override
  TextEditingController farmNameController = TextEditingController();
  TextEditingController sizeController = TextEditingController();

  String? selectedLocation;
  String? selectedFarmType;
  String? selectedCrop;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        //iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Set up your farm",
          style: GoogleFonts.inder(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Start to set up your farm and garden.",
                style: GoogleFonts.inder(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0D1814),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: farmNameController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Farm Name",
                  labelStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1814),
                  ),
                  hintText: "ex: Tomato Farm",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0D1814),
                  ),
                ),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: selectedLocation,
                onChanged: (val) => setState(() => selectedLocation = val),
                items: ['Location 1', 'Location 2']
                    .map((loc) => DropdownMenuItem(
                  value: loc,
                  child: Text(loc),
                ))
                    .toList(),
                //items: [DropdownMenuItem(child: Text("Choose location"))],
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Location",
                  labelStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1814),
                  ),
                ),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: selectedFarmType,
                onChanged: (val) => setState(() => selectedFarmType = val),
                // items: [DropdownMenuItem(child: Text("Choose farm type"))],
                items: ['Greenhouse', 'Open Field']
                    .map((type) => DropdownMenuItem(
                  value: type,
                  child: Text(type),
                ))
                    .toList(),
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Farm Type",
                  labelStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1814),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: sizeController,
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Size in Acres",
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1814),
                  ),
                ),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField<String>(
                value: selectedCrop,
                onChanged: (val) => setState(() => selectedCrop = val),
                items: ['Tomatoes', 'Potatoes']
                    .map((crop) => DropdownMenuItem(
                  value: crop,
                  child: Text(crop),
                ))
                    .toList(),
                // items: [DropdownMenuItem(child: Text("Tomatoes"))],
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Crop",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1814),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String farmName = farmNameController.text;
                    String sizeInAcres = sizeController.text;
                    if (farmName.isEmpty ||
                        sizeInAcres.isEmpty ||
                        selectedLocation == null ||
                        selectedFarmType == null ||
                        selectedCrop == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill in all fields")),
                      );
                      return;
                    }
                    String userId = FirebaseAuth.instance.currentUser!.uid;
                    FarmModel farmModel = FarmModel(
                      farmName: farmName,
                      location: selectedLocation!,
                      farmType: selectedFarmType!,
                      sizeInAcres: sizeInAcres,
                      crop: selectedCrop!,
                      userId: userId,
                    );
                    try {
                      await FirebaseFunctions.addFarm(farmModel);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmConfirmationScreen()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error saving farm: $e")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inder(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
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

class FarmConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text("Set up your farm",
            style: GoogleFonts.inder(fontSize: 20, color: Colors.black)),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/3d_checkmark.png",
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Text("Farm setup completed!",
                    style: GoogleFonts.inder(fontSize: 20)),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inder(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smartfarm_with_iot_app/home/home_screen.dart';
// import 'package:smartfarm_with_iot_app/home/tabs/home_tab.dart';
//
// class SetUpFarmScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "Set up your farm",
//           style: GoogleFonts.inder(
//             fontSize: 20,
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body:  Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 "Start to set up your farm and garden.",
//                 style: GoogleFonts.inder(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF0D1814),
//                 ),
//               ),
//               SizedBox(height: 30),
//               TextField(
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey[200],
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   labelText: "Farm Name",
//                   labelStyle: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF0D1814)),
//                   hintText: "ex: Tomato Farm",
//                   hintStyle: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF0D1814)),
//                 ),
//               ),
//               SizedBox(height: 30),
//               DropdownButtonFormField(
//                 items: [DropdownMenuItem(child: Text("Choose location"))],
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey[200],
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   labelText: "Location",
//                   labelStyle: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF0D1814)),
//                 ),
//               ),
//               SizedBox(height: 30),
//               DropdownButtonFormField(
//                 items: [DropdownMenuItem(child: Text("Choose farm type"))],
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey[200],
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   labelText: "Farm Type",
//                   labelStyle: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF0D1814)),
//                 ),
//               ),
//               SizedBox(height: 30),
//               TextField(
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey[200],
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   labelText: "Size in Acres",
//                   labelStyle: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF0D1814)),
//                 ),
//               ),
//               SizedBox(height: 30),
//               DropdownButtonFormField(
//                 items: [DropdownMenuItem(child: Text("Tomatoes"))],
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   fillColor: Colors.grey[200],
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   labelText: "Crop",
//                   labelStyle: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF0D1814)),
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               // Spacer(),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => FarmConfirmationScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   padding: EdgeInsets.symmetric(horizontal: 150),
//                   minimumSize: Size.fromRadius(30),
//                   shape: ContinuousRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                   elevation: 15,
//                   side: BorderSide(
//                     color: Colors.green,
//                   ),
//                 ),
//                 child: Text(
//                   "Continue",
//                   style: GoogleFonts.inder(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//     );
//   }
// }
//
// class FarmConfirmationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text("Set up your farm",
//             style: GoogleFonts.inder(fontSize: 20, color: Colors.black)),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Image.asset(
//               "assets/images/3d_checkmark.png",
//               width: 170,
//               height: 170,
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text("Farm setup completed!", style: GoogleFonts.inder(fontSize: 20)),
//           SizedBox(height: 50),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomeScreen(),
//                   ));
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//               padding: EdgeInsets.symmetric(horizontal: 150),
//               minimumSize: Size.fromRadius(30),
//               shape: ContinuousRectangleBorder(
//                   borderRadius: BorderRadius.circular(30)),
//               elevation: 15,
//               side: BorderSide(
//                 color: Colors.green,
//               ),
//             ),
//             child: Text(
//               "Continue",
//               style: GoogleFonts.inder(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
