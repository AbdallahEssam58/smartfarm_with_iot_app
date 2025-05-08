// import 'package:flutter/material.dart';
//
// class ScreenDetailsScreen extends StatelessWidget{
//   final String sensorType;
//   final String plantName;
//   ScreenDetailsScreen({super.key, required this.sensorType, required this.plantName});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('$plantName - $sensorType Data')),
//       body: Center(
//         child: Text(
//           'Sensor: $sensorType\nPlant: $plantName\nTemperature: ${20 + plantName.length}°C',
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }