import 'package:flutter/material.dart';
import 'package:smartfarm_with_iot_app/home/tabs/ai_tab.dart';
import 'package:smartfarm_with_iot_app/home/tabs/home_tab.dart';
import 'package:smartfarm_with_iot_app/home/tabs/myfileds_tab.dart';
import 'package:smartfarm_with_iot_app/home/tabs/personal_tab.dart';
import 'package:smartfarm_with_iot_app/home/tabs/statistics_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // String label=ModalRoute.of(context)?.settings as String;
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF2F3F2),
        selectedItemColor: Color(0xFF7BBC5C),
        unselectedItemColor: Color(0xFF878787),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/Home.png")),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/Fields.png")),
              label: "My Fileds"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/single-user.png")),
              label: "Profile"),
          // BottomNavigationBarItem(
          //     icon: ImageIcon(AssetImage("assets/images/Statistics.png")),
          //     label: "Statistics"),
          // BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: "Ai"),
          // BottomNavigationBarItem(
          //     icon: ImageIcon(AssetImage("assets/images/Ai.png")),
          //     label: "Ai"),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    MyfiledsTab(),
    PersonalTab(),
    // StatisticsTab(),
    //AiTab(),
  ];
}





























// Scaffold(
// backgroundColor: Colors.white,
// appBar: AppBar(
// automaticallyImplyLeading: false,
// backgroundColor: Colors.white,
// elevation: 0,
// title: Container(
// width: 120,
// height: 30,
// decoration: BoxDecoration(
// color: Color(0xFFF2F3F2),
// borderRadius: BorderRadius.circular(15)),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// ImageIcon(
// AssetImage("assets/images/Navigation, Maps.png"),
// color: Colors.black,
// ),
// Text(
// "Cairo , Egypt",
// style: GoogleFonts.cabin(
// fontSize: 14,
// fontWeight: FontWeight.w400,
// color: Colors.black),
// ),
// ],
// ),
// ),
// actions: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: ImageIcon(
// AssetImage("assets/images/Bell, Notifications.png"),
// color: Colors.black,
// ),
// ),
// ],
// ),
// body: Column(
// children: [
// Center(
// child: Padding(
// padding: const EdgeInsets.all(15.0),
// child: Image.asset("assets/images/Weather.png"),
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "24°",
// style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
// )
// ],
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Today is partly sunny day!",
// style: GoogleFonts.aBeeZee(
// fontSize: 15,
// fontWeight: FontWeight.w400,
// ),
// )
// ],
// ),
// SizedBox(
// height: 20,
// ),
// Container(
// height: 66,
// width: 375,
// decoration: BoxDecoration(
// color: Color(0xFF7BBC5C),
// borderRadius: BorderRadius.circular(15)),
// child: Stack(
// children: [
// Image.asset(
// "assets/images/Frame 19.png",
// width: 80,
// height: 80,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// "Check our AI recommendation for\n your fields!",
// style: GoogleFonts.aBeeZee(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// color: Colors.white,
// ),
// ),
// ),
// SizedBox(
// width: 3,
// ),
// Icon(
// Icons.arrow_forward,
// color: Colors.white,
// ),
// ],
// ),
// ],
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Text(
// "My Fields",
// style: GoogleFonts.aBeeZee(
// fontSize: 18,
// fontWeight: FontWeight.w800,
// color: Colors.black,
// ),
// ),
// ),
// TextButton(
// onPressed: () {},
// child: Text(
// "See All",
// style: GoogleFonts.aBeeZee(
// fontSize: 15,
// fontWeight: FontWeight.bold,
// color: Color(0xFF7BBC5C),
// ),
// ),
// ),
// ],
// ),
// SizedBox(
// height: 190,
// child: ListView(
// scrollDirection: Axis.horizontal,
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Fildcard(title: 'Tomatoes', acres: '8 Acre'),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Fildcard(title: 'Lettuce', acres: '2 Acre'),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Fildcard(title: 'Rice', acres: '3 Acre'),
// ),
// ],
// ),
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// "Statistics & Instructions",
// style: GoogleFonts.aBeeZee(
// fontSize: 18,
// fontWeight: FontWeight.w800,
// color: Colors.black,
// ),
// ),
// ),
// ],
// ),
// SizedBox(
// height: 4,
// ),
// Padding(
// padding: const EdgeInsets.all(6.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Statcard(
// label: "Light Intensity",
// imagePath: "assets/images/Light Intensity.png",
// ),
// Statcard(
// label: "Humidity",
// imagePath: "assets/images/Humidity.png",
// ),
// Statcard(
// label: "Fire Detection",
// imagePath: "assets/images/Fire Detection.png",
// ),
// Statcard(
// label: "Temperature",
// imagePath: "assets/images/Temperature.png",
// ),
// ],
// ),
// ),
// ],
// ),
// );