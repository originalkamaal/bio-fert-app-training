import 'package:flutter/material.dart';
import 'package:learningdart/pages/auth/forgot_pass.dart';
import 'package:learningdart/pages/home/home_screen.dart';
import 'package:learningdart/pages/auth/register.dart';
import 'package:learningdart/pages/auth/sign_in.dart';
import 'package:learningdart/pages/home/welcome.dart';

class MyRoutes {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Welcome());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case '/signin':
        return MaterialPageRoute(builder: (context) => const SignIn());
      case '/register':
        return MaterialPageRoute(builder: (context) => const Register());

      case '/forgotPass':
        return MaterialPageRoute(builder: (context) => const ForgotPassword());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error 404')),
        ),
      );
    });
  }
}
