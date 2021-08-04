import 'package:flutter/material.dart';
import 'package:restfull_api/commons/enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key, required this.selectedMenu})
      : super(key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xffdadada).withOpacity(0.5)),
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  color: MenuState.home == selectedMenu
                      ? Colors.red
                      : Colors.black38,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.directions_car,
                  color: MenuState.car == selectedMenu
                      ? Colors.red
                      : Colors.black38,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.map,
                  color: MenuState.map == selectedMenu
                      ? Colors.red
                      : Colors.black38,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: MenuState.profile == selectedMenu
                      ? Colors.red
                      : Colors.black38,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
