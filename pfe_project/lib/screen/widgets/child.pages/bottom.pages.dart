import 'package:flutter/material.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/home.page.child.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/chat.screen.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/contacts.pages.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/profile.page.dart';
import 'package:pfe_project/screen/widgets/child.pages/bottom.screens.dart/rating.page.dart';
import 'package:pfe_project/utils/global.colors.dart';

class BottomPages extends StatefulWidget {
  BottomPages({Key? key}) : super(key: key);

  @override
  State<BottomPages> createState() => _BottomPagesState();
}

class _BottomPagesState extends State<BottomPages> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomePageChild(),
    ContactsPages(),
    ChatPage(),
    ProfilePage(),
    RatingPage(),
  ];

  onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(
              label: 'home',
              icon: Icon(
                Icons.home,
                color: GlobalColors.mainColor,
              )),
          BottomNavigationBarItem(
              label: 'contacts',
              icon: Icon(
                Icons.contacts,
                color: GlobalColors.mainColor,
              )),
          BottomNavigationBarItem(
              label: 'chats',
              icon: Icon(
                Icons.chat,
                color: GlobalColors.mainColor,
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
                color: GlobalColors.mainColor,
              )),
          BottomNavigationBarItem(
              label: 'Reviews',
              icon: Icon(
                Icons.reviews,
                color: GlobalColors.mainColor,
              ))
        ],
      ),
    );
  }
}
