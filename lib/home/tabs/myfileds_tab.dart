import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen_details_screen.dart';
import 'home_tab.dart';

class MyfiledsTab extends StatelessWidget {

  MyfiledsTab({super.key, });



  final List<Map<String, String>> fields = [
    {'name': 'Tomatoes', 'size': '8 Acre'},
    {'name': 'Lettuce', 'size': '2 Acre'},
    {'name': 'Tomatoes', 'size': '8 Acre'},
    {'name': 'Lettuce', 'size': '2 Acre'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xFFF2F3F2),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageIcon(
                AssetImage("assets/images/Navigation, Maps.png"),
                color: Colors.black,
              ),
              Text(
                "Cairo , Egypt",
                style: GoogleFonts.cabin(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage("assets/images/Bell, Notifications.png"),
              color: Colors.black,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ImageIcon(
          //     AssetImage("assets/images/Bell, Notifications.png"),
          //     color: Colors.black,
          //   ),
          // ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My Fields",
              style: GoogleFonts.inder(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
              ),
              itemCount: fields.length+1,
              itemBuilder: (context, index) {


                if (index < fields.length) {
                  return FieldCard(
                    name: fields[index]['name']!,
                    size: fields[index]['size']!,
                  );
                } else {
                  return AddFieldCard();
                }


              },
            ),
          ),
        ],
      ),
    );
  }
}

class FieldCard extends StatelessWidget {
  final String name;
  final String size;

  FieldCard({required this.name, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 14, left: 1),
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage("assets/images/Fild.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            size,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class AddFieldCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.green[100],
        child: Center(
          child: ImageIcon(
            AssetImage("assets/images/Add_Field.png"),
            size: 50,
            color: Color(0xFF7BBC5C),
          ),
        ),
      ),
    );
  }
}















// return GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => ScreenDetailsScreen(
// sensorType: sensorType, // تمرير نوع المستشعر
// plantName: fields[index]['name']!, // تمرير اسم النبات
// ),
// ),
// );
// },
// );































//
// Card(
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// clipBehavior: Clip.antiAlias,
// child: Stack(
// alignment: Alignment.bottomLeft,
// children: [
// Image.asset(
// "assets/images/Lettuce.png",
// fit: BoxFit.cover,
// height: double.infinity,
// width: double.infinity,
// ),
// Container(
// padding: EdgeInsets.all(8),
// color: Colors.black54,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// name,
// style: TextStyle(
// color: Colors.white,
// fontSize: 16,
// fontWeight: FontWeight.bold),
// ),
// Text(
// size,
// style: TextStyle(color: Colors.white, fontSize: 12),
// ),
// ],
// ),
// ),
// ],
// ),
// );