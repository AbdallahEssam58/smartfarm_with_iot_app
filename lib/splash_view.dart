// import 'package:flutter/material.dart';
// import 'onboarding.dart';
//
//
// class SplashView extends StatefulWidget{
//   static const String routeName="SplashScreen";
//   const SplashView({super.key});
//
//   @override
//   State<SplashView> createState() => _SplashViewState();
//
// }
//
// class _SplashViewState extends State<SplashView> {
//
//   @override
//   void initState(){
//     super.initState();
//     Future.delayed(const Duration(seconds: 4),(){
//       Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
//     }
//     );
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Image.asset("assets/images/Splash_Logo (2).png")),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'onboarding.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              "assets/images/Splash_Logo (2).png",
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
