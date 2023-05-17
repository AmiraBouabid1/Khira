import 'package:flutter/material.dart';
import 'package:pfe_project/screen/widgets/child.pages/signup.child.dart';
import 'package:pfe_project/screen/widgets/volunteer.pages/login.volunteer.dart';
import 'package:pfe_project/screen/widgets/volunteer.pages/signup.volunteer.dart';
import 'package:pfe_project/utils/global.colors.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                Center(
                  child: Text(
                    "Hello! Now you should choose ",
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
            const SizedBox(height: 50),
            Column(
              children: <Widget>[
                ////the Child button
                MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpChild())));
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Sign Up as User",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    )),
                const SizedBox(height: 50),
                ////the Volunteer button
                MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpVolunteer())));
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Sign Up as Volunteer",
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
