import 'package:flutter/material.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.18,
                  backgroundColor: Colors.grey.shade300,
                  child: ImageIcon(
                    AssetImage("assets/images/Personal.png"),
                    size: size.width * 0.18,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '@ahmed121',
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 3),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset("assets/images/Vector.png",color: Colors.green,height: 30,),
                    // Icon(Icons.email, color: Colors.green, size: 28),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your Email Address",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "ahmed121@gmail.com",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(thickness: 3),
                Row(
                  children: [
                    Image.asset("assets/images/Fields.png",color: Colors.green,height: 30,),
                    //ImageIcon(AssetImage("assets/images/Fields.png"),color: Colors.green,),
                    // Icon(Icons.grass, color: Colors.green, size: 28),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Number of Fields",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "4 Fields",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}