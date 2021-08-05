import 'package:flutter/material.dart';
import 'package:restfull_api/models/entities/user.dart';
import 'package:restfull_api/screens/HomeScreen.dart';
import 'package:restfull_api/screens/home/login_screen.dart';
import 'package:restfull_api/screens/user/user_detail_screen.dart';
import 'package:restfull_api/screens/user/user_profile_screen.dart';
import 'package:restfull_api/screens/user/user_screen.dart';

const defaultRoute = '/';
const userRoute = "/user";
const loginRoute = "/login";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      //First page
      case defaultRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => SampleApp());
      case userRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserScreen());
      case loginRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case UserProfile.route:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserProfile(
                  user: args,
                ));
      case UserProfileDetail.route:
        return MaterialPageRoute(
            builder: (BuildContext context) => UserProfileDetail(user: args));
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
