import 'package:flutter/material.dart';
import 'package:restfull_api/screens/HomeScreen.dart';
import 'package:restfull_api/screens/home/login_screen.dart';
import 'package:restfull_api/screens/user/user_screen.dart';

const defaultRoute = '/';
const userRoute = "/user";
const loginRoute = "/login";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      //First page
      case defaultRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => SampleApp());
      case userRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserScreen());
      case loginRoute:
        if (args is String) {
          return MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen());
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Error'),
          ));
    });
  }
}
