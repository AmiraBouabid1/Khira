// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_project/screen/widgets/choose.page.dart';
import 'package:pfe_project/utils/global.colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/angels.png", height: 300.0, width: 300.0),
            Column(
              children: const [
                Center(
                  child: Text(
                    "khira",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              children: const [
                Center(
                  child: Text(
                    "join khira family",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              children: <Widget>[
                ////the login button
                MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ChoosePage())));
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
