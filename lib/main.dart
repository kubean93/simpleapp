import 'package:flutter/material.dart';
import 'package:restfull_api/commons/route_generator.dart';
import 'package:restfull_api/screens/home/login_screen.dart';
import 'package:restfull_api/screens/user/user_profile_screen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfile(),
    );
  }
}
