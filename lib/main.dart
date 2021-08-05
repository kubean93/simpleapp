import 'package:flutter/material.dart';
import 'package:restfull_api/commons/route_generator.dart';
import 'package:restfull_api/screens/home/login_screen.dart';
import 'package:restfull_api/screens/user/user_profile_screen.dart';

import 'commons/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'VTracking v3',
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: BackgrounPrimary,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          )),
      home: LoginScreen(),
    );
  }
}
