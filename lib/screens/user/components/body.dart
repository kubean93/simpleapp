import 'package:flutter/material.dart';
import 'package:restfull_api/models/entities/user.dart';
import 'package:restfull_api/screens/user/components/profile_menu.dart';
import 'package:restfull_api/screens/user/components/profile_pic.dart';
import 'package:restfull_api/screens/user/user_detail_screen.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.user}) : super(key: key);
  final Color background = Color(0xfff4f6f9);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          background: background,
          text: "My Account",
          icon: Icon(
            Icons.person,
            color: Colors.black38,
          ),
          press: () {
            Navigator.pushNamed(context, UserProfileDetail.route,
                arguments: user);
          },
        ),
        ProfileMenu(
          background: background,
          text: "Notifications",
          icon: Icon(
            Icons.notifications,
            color: Colors.black38,
          ),
          press: () {},
        ),
        ProfileMenu(
          background: background,
          text: "Settings",
          icon: Icon(
            Icons.settings,
            color: Colors.black38,
          ),
          press: () {},
        ),
        ProfileMenu(
          background: background,
          text: "Logout",
          icon: Icon(
            Icons.logout,
            color: Colors.black38,
          ),
          press: () {},
        ),
      ],
    );
  }
}
