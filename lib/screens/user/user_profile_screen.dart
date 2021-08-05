import 'package:flutter/material.dart';
import 'package:restfull_api/commons/enums.dart';
import 'package:restfull_api/models/entities/user.dart';
import 'package:restfull_api/screens/user/components/body.dart';

import 'components/custom_bottom_nav_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.user}) : super(key: key);
  static const route = "/profile";
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Body(user: user),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
