import 'package:flutter/material.dart';
import 'onboarding.dart';


class SplashView extends StatefulWidget{
  static const String routeName="SplashScreen";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    }
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/Splash_Logo (2).png")),
        ],
      ),
    );
  }
}