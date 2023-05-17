import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_project/screen/widgets/button1.dart';
import 'package:pfe_project/screen/widgets/child.pages/signup.child.dart';
import 'package:pfe_project/screen/widgets/choose.page.dart';
import 'package:pfe_project/screen/widgets/social.login.dart';
import 'package:pfe_project/screen/widgets/text.form.dart';
import 'package:pfe_project/screen/widgets/volunteer.pages/home.page.volunteer.dart';
import 'package:pfe_project/screen/widgets/volunteer.pages/signup.volunteer.dart';
import 'package:pfe_project/utils/constants.dart';
import 'package:pfe_project/utils/global.colors.dart';

class LoginVolunteer extends StatefulWidget {
  LoginVolunteer({super.key});
  static String name = "";
  static String userId = "";

  @override
  State<LoginVolunteer> createState() => _LoginVolunteerState();
}

class _LoginVolunteerState extends State<LoginVolunteer> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Volunteer Login',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcom back! Now you can login to your account',
                  style: TextStyle(
                    color: GlobalColors.texColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                ////email input
                TextForm(
                  controller: _emailController,
                  text: 'Email',
                  obscure: false,
                  onsave: (email) {
                    _formData["email"] = email ?? "";
                  },
                  validate: (email) {
                    if (email!.isEmpty ||
                        email.length < 3 ||
                        !email.contains("@")) {
                      return "Email is not valid";
                    }
                    return null;
                  },
                  textInputType: TextInputType.emailAddress,
                ),
                ////password input
                const SizedBox(height: 10),

                TextForm(
                  controller: _passwordController,
                  text: 'Password',
                  onsave: (password) {
                    _formData["password"] = password ?? "";
                  },
                  validate: (password) {
                    if (password!.isEmpty || password.length < 7) {
                      return "Password is not valid";
                    }
                    return null;
                  },
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                        )),
                  ),
                ),
                ////button
                const SizedBox(height: 50),
                Button1(
                  title: "Login",
                  onPressed: () {
                    goto(context, HomePageVolunteer());
                  },
                ),
                const SizedBox(height: 25),
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpVolunteer(),
                    ));
              },
              child: Text(
                'Sign Up ',
                style: TextStyle(
                  color: GlobalColors.mainColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
