import 'package:flutter/material.dart';
import 'package:restfull_api/screens/user/components/profile_menu.dart';
import 'package:restfull_api/screens/user/components/profile_pic.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  Color background = Color(0xfff4f6f9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        ProfileMenu(
          background: background,
          text: "My Account",
          icon: Icon(
            Icons.person,
            color: Colors.black38,
          ),
          press: () {},
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
