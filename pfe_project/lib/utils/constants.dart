import 'package:flutter/material.dart';

void goto(BuildContext context, Widget nextScreen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ));
}

dialogueBox(BuildContext context, String text) {
  showDialog(
      context: context, builder: ((context) => AlertDialog(title: Text(text))));
}

class Constants {
  static String appId = "1:12241161073:web:eb7657f016b3ef1bf904d0";
  static String apiKey = "AIzaSyCl3SrW2QXpRsJ4gxWb2nr1fj_4w06-67o";
  static String messagingSenderId = "12241161073";
  static String projectId = "khira-3212c";
}
