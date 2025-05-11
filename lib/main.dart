import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smartfarm_with_iot_app/home/home_screen.dart';
import 'package:smartfarm_with_iot_app/provider/my_provider.dart';
import 'package:smartfarm_with_iot_app/setup_farm.dart';
import 'package:smartfarm_with_iot_app/splash_view.dart';
import 'package:smartfarm_with_iot_app/onboarding.dart';

import 'firebase_options.dart';
import 'home/tabs/home_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    // ✅ تحميل بيانات المستخدم بعد تسجيل الدخول
    if (pro.firebaseUser != null && pro.userModel == null) {
      pro.initUser();
    }
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
            SplashView.routeName: (context) => SplashView(),
            HomeTab.routeName: (context) => HomeTab(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SetUpFarmScreen.routeName: (context) => SetUpFarmScreen(),
          },
          initialRoute: pro.firebaseUser!=null?HomeScreen.routeName: SplashView.routeName,
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:smartfarm_with_iot_app/home/home_screen.dart';
// import 'package:smartfarm_with_iot_app/splash_view.dart';
// import 'onboarding.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//      // home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//       routes: {
//         OnboardingScreen.routeName: (context) => OnboardingScreen(),
//          SplashView.routeName: (context) => SplashView(),
//         // HomeScreen.routeName: (context) => HomeScreen(),
//          // Home.routeName:(context)=>Home(),
//       },
//       initialRoute: SplashView.routeName,
//     );
//   }
// }

