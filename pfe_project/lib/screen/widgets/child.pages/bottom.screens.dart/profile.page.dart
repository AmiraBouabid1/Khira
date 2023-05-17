import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/profile.page.dart';
import 'package:pfe_project/utils/global.colors.dart';

import 'profile.pic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 30),
        ProfileMenu(
          icon: "assets/user.png",
          text: "My Account",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/bell.png",
          text: "Notification",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/setting.png",
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/help.jpg",
          text: "Help Center",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/logout.png",
          text: "Log Out",
          press: () {},
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: MaterialButton(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white54,
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 22,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(Icons.arrow_back_ios_new_outlined),
          ],
        ),
      ),
    );
  }
}
