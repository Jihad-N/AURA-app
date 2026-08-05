import 'package:ecommerce_project/features/auth/screens/login_screen.dart';
import 'package:ecommerce_project/features/auth/screens/sign_up_screen.dart';
import 'package:ecommerce_project/features/home/screen/home_screen.dart';
import 'package:ecommerce_project/features/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';


import 'app_routes.dart';


class AppRouter {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch(settings.name) {

      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );


      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) =>  LoginScreen(),
        );


      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (_) =>  SignUpScreen(),
        );


      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page Not Found"),
            ),
          ),
        );
    }
  }
}