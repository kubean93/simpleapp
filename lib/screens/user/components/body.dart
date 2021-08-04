import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restfull_api/screens/user/components/profile_pic.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  Color background = Colors.black12;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: background,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black38,
                  size: 25,
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Text(
                  "My Account",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black38,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
