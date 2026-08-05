import 'package:ecommerce_project/features/auth/screens/login_screen.dart';
import 'package:ecommerce_project/features/auth/screens/sign_up_screen.dart';
import 'package:ecommerce_project/features/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const JewelryApp());
}

class JewelryApp extends StatelessWidget {
  const JewelryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'SplashScreen': (context) => SplashScreen(),
        'LoginScreen': (context) => LoginScreen(),
        'SignUpScreen': (context) => SignUpScreen(),
        'JewelryApp': (context) => JewelryApp(),
      },
      initialRoute: 'SplashScreen',
    );
  }
}
